extern float time;
extern vec2 love_ScreenSize;
extern vec4 rising_smoke;

vec4 effect(vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 tex = Texel(texture, texture_coords);

    // UV-Koordination von Balatro (Template-konform)
    vec2 uv = (((texture_coords) * (image_details)) - texture_details.xy * texture_details.ba) / texture_details.ba;

    // Seitenverhältnis korrigieren (wie in deinem Original)
    uv.x *= love_ScreenSize.x / love_ScreenSize.y;

    float t = time * 0.3;

    vec2 move = vec2(uv.x + t, uv.y);

    float smoke = 0.0;
    smoke += smoothNoise(move * 3.0 + t * 0.5) * 0.4;
    smoke += smoothNoise(move * 6.0 - t * 0.2) * 0.3;
    smoke += smoothNoise(move * 12.0 + t * 0.1) * 0.3;

    smoke *= smoothstep(0.5, 1.0, uv.x);

    vec3 color = vec3(0.2, 0.22, 0.25) * smoke;
    vec4 final_color = vec4(color, clamp(rising_smoke.x, smoke, smoke));

    return dissolve_mask(tex * final_color, texture_coords, uv);
}