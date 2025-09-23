--- GLOBALS

G.C.CSTORM = {
    PURE_RED = HEX("FF0000"),
    PURE_BLACK = HEX("000000"),
    TRANSPARENT = HEX("00000000"),
    MOD = HEX("1c95e6"),
    GIT = HEX("7919b5"),
    XYZ = HEX("546587"),
    BUTTONS = HEX("FF463C"),
    CON_BUTTON = HEX("FF8700"),
    TOKENS = HEX("06540b"),
    ASTRO = HEX("230049")
}

-- Hooks

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
    G.ARGS.LOC_COLOURS.cstorm_pure_red = G.C.CSTORM.PURE_RED
    G.ARGS.LOC_COLOURS.cstorm_pure_black = G.C.CSTORM.PURE_BLACK
    G.ARGS.LOC_COLOURS.cstorm_transparent = G.C.CSTORM.TRANSPARENT
    G.ARGS.LOC_COLOURS.cstorm_mod = G.C.CSTORM.MOD
    G.ARGS.LOC_COLOURS.cstorm_git = G.C.CSTORM.GIT
    G.ARGS.LOC_COLOURS.cstorm_xyz = G.C.CSTORM.XYZ
    G.ARGS.LOC_COLOURS.cstorm_buttons = G.C.CSTORM.BUTTONS
    G.ARGS.LOC_COLOURS.cstorm_con_buttons = G.C.CSTORM.CON_BUTTONS
    G.ARGS.LOC_COLOURS.cstorm_tokens = G.C.CSTORM.TOKENS
    G.ARGS.LOC_COLOURS.cstorm_astro = G.C.CSTORM.ASTRO
    return loc_colour_ref(_c, _default)
end