#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif

/*
    Curse Shader effect

    Creates two alternating pulsing circles (top/bottom) with purple tint.
    Circles alternate using inverted sin waves.
*/

//name of shader
extern PRECISION vec2 curseShader;

extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

// COORDINATE SYSTEMS:
// uv              = Object space (0-1 for this sprite)
// texture_coords  = Atlas space (position in packed texture sheet)
vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);

    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;

    //a variable needed to always refresh the shader(time alone doesn't work)
    float t = curseShader.g + time;

    float radius = 0.75;                //Radius of effect circles in UV Space
    float aspectRatio = 95.0 / 71.0;    //Height/Width to correct for non-square texture
    vec2 anchorPointBottom = vec2(0.5, 1);  //Bottom Center Position
    vec2 anchorPointTop = vec2(0.5, 0);     //Top Center Position


    // ============================================
    // CURSE EFFECT: Distance Calculation
    // ============================================

    vec2 diffBottom = uv - anchorPointBottom;   //Calculating the distance for bottom circle
    vec2 diffTop = uv - anchorPointTop;         //Calculating the distance for top circle
    diffBottom.x /= aspectRatio;                //Using the aspect ratio to prevent deforming
    diffTop.x /= aspectRatio;                   //Likewise here
    float distanceAnchorBottom = length(diffBottom);    //Using length to get the distance from pixel to anchor
    float distanceAnchorTop = length(diffTop);          //Again, likewise here
    float normDistanceBottom = distanceAnchorBottom / radius;   //Normalizing the distance to 0 - 1
    float normDistanceTop = distanceAnchorTop / radius;         //Here too
    float darknessIntensityBottom;
    float darknessIntensityTop;

    //Invert normalized distance: closer to anchor = higher intensity (1.0), far = lower (0.0)
    if (distanceAnchorBottom <= radius)
    {
        darknessIntensityBottom = 1.0 - normDistanceBottom;
    }
    else
    {
        darknessIntensityBottom = 0;    // Outside radius: no effect
    }

    //The same for the Top circle too
    if (distanceAnchorTop <= radius)
    {
        darknessIntensityTop = 1.0 - normDistanceTop;
    }
    else
    {
        darknessIntensityTop = 0;       // Outside radius: no effect
    }

    // ============================================
    // CURSE EFFECT: Pulse Animation
    // ============================================

    float pulseBottom = (sin(t * 2) + 1.0) / 2.0;       //Making the bottom circle pulse by using sin
    float pulseTop = (-sin(t * 2) + 1.0) / 2.0;         //Perfect opposite by using -sin
    float finalIntensityBottom = darknessIntensityBottom * pulseBottom;     //Combining the darkness with the pulse
    float finalIntensityTop = darknessIntensityTop * pulseTop;              //Yep, here too


    // Adding both intensities to allow for potential overlap
    // (though they shouldn't overlap with alternating pulses)
    float finalIntensityAll = finalIntensityBottom + finalIntensityTop;

    vec3 curseColor = vec3(0.5, 0, 0.8); //purple

    // Blend original texture with curse color based on intensity
    // (1-intensity) keeps original, intensity adds curse effect
    tex.rgb = tex.rgb * (1.0 - finalIntensityAll) + (curseColor * finalIntensityAll);
    tex.a *= (1.0 - finalIntensityAll * 0.1);

    return dissolve_mask(tex*colour, texture_coords, uv);
}

//Don't touch anything here, I don't fucking know what this does
vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01; //Adjusting 0.0-1.0 to fall to -0.1 - 1.1 scale so the mask does not pause at extreme values

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
	
	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif