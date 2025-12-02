#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif

//name of shader
extern PRECISION vec2 fractalShader;

extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);

    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;

    number low = min(tex.r, min(tex.g, tex.b));
    number high = max(tex.r, max(tex.g, tex.b));
    number delta = high-low -0.1;

    number fac = 0.8 + 0.9*sin(11.*uv.x+4.32*uv.y + fractalShader.r*12. + cos(fractalShader.r*5.3 + uv.y*4.2 - uv.x*4.));
    number fac2 = 0.5 + 0.5*sin(8.*uv.x+2.32*uv.y + fractalShader.r*5. - cos(fractalShader.r*2.3 + uv.x*8.2));
    number fac3 = 0.5 + 0.5*sin(10.*uv.x+5.32*uv.y + fractalShader.r*6.111 + sin(fractalShader.r*5.3 + uv.y*3.2));
    number fac4 = 0.5 + 0.5*sin(3.*uv.x+2.32*uv.y + fractalShader.r*8.111 + sin(fractalShader.r*1.3 + uv.y*11.2));
    number fac5 = sin(0.9*16.*uv.x+5.32*uv.y + fractalShader.r*12. + cos(fractalShader.r*5.3 + uv.y*4.2 - uv.x*4.));

    number maxfac = 0.7*max(max(fac, max(fac2, max(fac3,0.0))) + (fac+fac2+fac3*fac4), 0.);

    float t = fractalShader.g + time;

    float loopDuration = 12.0;
    float zoomCycle = mod(t * 0.25, loopDuration);
    float loopProgress = zoomCycle / loopDuration; // 0 bis 1

    // Smooth Transition at End/Start
    float smoothProgress = smoothstep(0.0, 0.05, loopProgress) * (1.0 - smoothstep(0.95, 1.0, loopProgress));
    float zoom = exp(-zoomCycle * 0.7) * 2.5 * smoothProgress + 2.5 * (1.0 - smoothProgress);


    //Classic Zoom Point
    vec2 center = vec2(-0.7463, 0.1102);

    //Small rotation during zoom
    float angle = t * 0.1;
    float cosA = cos(angle);
    float sinA = sin(angle);

    vec2 centered = vec2(uv.x - 0.5, uv.y - 0.5);
    vec2 rotated = vec2(
        centered.x * cosA - centered.y * sinA,
        centered.x * sinA + centered.y * cosA
    );

    number xc = rotated.x * zoom + center.x;
    number yc = rotated.y * zoom + center.y;

    vec2 c = vec2(xc, yc);
    vec2 z = vec2(0.0, 0.0);

    int maxIterations = 200;
    int i = 0;
    float tmp;

    for(i = 0; i < maxIterations; i++)
    {
        tmp = (z.x * z.x) - (z.y * z.y) + c.x;
        z.y = (2.0 * z.x * z.y) + c.y;
        z.x = tmp;

        if(dot(z, z) > 4.0)
            break;
    }

    float normValue = float(i) / float(maxIterations);

    //Dynamic Colors
    float colorSpeed = t * 0.5;
    tex.r = 0.5 + 0.5 * sin(normValue * 15.0 + colorSpeed);
    tex.g = 0.5 + 0.5 * sin(normValue * 12.0 + colorSpeed + 2.0);
    tex.b = 0.5 + 0.5 * sin(normValue * 9.0 + colorSpeed + 4.0);

    //Insides = black
    if (i >= maxIterations) {
        tex.rgb = vec3(0.0, 0.0, 0.0);
    }
    tex.a = tex.a * 0.75;

    return dissolve_mask(tex * colour, texture_coords, uv);
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