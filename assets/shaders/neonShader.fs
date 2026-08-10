#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define PRECISION highp
#else
	#define PRECISION mediump
#endif

//name of shader
extern PRECISION vec2 neonShader;

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

    if (uv.x == uv.x + 1) {
        uv = neonShader;
    }

    // Neon glow intensity calculation
    float t = time * 2.0;
    
    // Multiple sine waves for pulsating neon effect
    float pulse1 = 0.5 + 0.5 * sin(t * 3.0 + uv.x * 10.0);
    float pulse2 = 0.5 + 0.5 * sin(t * 2.0 - uv.y * 8.0);
    float pulse3 = 0.5 + 0.5 * sin(t * 4.0 + length(uv - 0.5) * 15.0);
    
    // Combined pulsation
    float neon_pulse = (pulse1 + pulse2 + pulse3) / 3.0;
    neon_pulse = 0.95 + 0.05 * neon_pulse; // Keep it mostly bright
    
    // Edge detection for neon outline
    float luminance = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
    
    // Sample neighboring pixels for edge detection
    vec2 texel_size = 1.0 / image_details;
    float edge = 0.0;
    
    for(float x = -1.0; x <= 1.0; x += 1.0) {
        for(float y = -1.0; y <= 1.0; y += 1.0) {
            vec2 offset = vec2(x, y) * texel_size * 2.0;
            vec4 sample_tex = Texel(texture, texture_coords + offset);
            float sample_lum = dot(sample_tex.rgb, vec3(0.299, 0.587, 0.114));
            edge += abs(luminance - sample_lum);
        }
    }
    edge = smoothstep(0.1, 0.5, edge);
    
    // Neon colors - vibrant and glowing
    vec3 neon_base = tex.rgb * 1.05; // Boost base brightness
    
    // Add color boost based on original colors
    vec3 neon_boost = vec3(0.0);
    if(tex.r > tex.g && tex.r > tex.b) {
        // Red/Pink neon
        neon_boost = vec3(1.0, 0.1, 0.5) * edge * 0.15;
    } else if(tex.g > tex.r && tex.g > tex.b) {
        // Green neon
        neon_boost = vec3(0.1, 1.0, 0.3) * edge * 0.15;
    } else if(tex.b > tex.r && tex.b > tex.g) {
        // Blue/Cyan neon
        neon_boost = vec3(0.2, 0.5, 1.0) * edge * 0.15;
    } else {
        // White/multi-color neon
        neon_boost = vec3(0.8, 0.8, 1.0) * edge * 0.15;
    }
    
    // Combine base color with neon glow
    vec3 final_color = neon_base + neon_boost * neon_pulse;
    
    // Add outer glow
    float glow_intensity = edge * 0.15;
    final_color += tex.rgb * glow_intensity * neon_pulse;
    
    // Saturate colors for that neon look
    float saturation = 1.5;
    vec3 luminance_vec = vec3(dot(final_color, vec3(0.299, 0.587, 0.114)));
    final_color = mix(luminance_vec, final_color, saturation);
    
    // Apply to texture
    tex.rgb = final_color;
    tex.a = tex.a;

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