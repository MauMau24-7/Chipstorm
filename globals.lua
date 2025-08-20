--- GLOBALS

G.C.CSTORM = {
    RED = HEX("FF0000"),
    BLACK = HEX("000000"),
    BLUE = HEX("0000FF"),
    GREEN = HEX("00FF00"),
    WHITE = HEX("FFFFFF"),
    TRANSPARENT = HEX("00000000"),
    MOD = HEX("1c95e6"),
    GIT = HEX("7919b5"),
    XYZ = HEX("546587"),
    BUTTONS = HEX("FF463C"),
    CON_BUTTON = HEX("FF8700"),
}

-- Hooks

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
    G.ARGS.LOC_COLOURS.cstorm_red = G.C.CSTORM.RED
    G.ARGS.LOC_COLOURS.cstorm_black = G.C.CSTORM.BLACK
    G.ARGS.LOC_COLOURS.cstorm_blue = G.C.CSTORM.BLUE
    G.ARGS.LOC_COLOURS.cstorm_green = G.C.CSTORM.GREEN
    G.ARGS.LOC_COLOURS.cstorm_white = G.C.CSTORM.WHITE
    G.ARGS.LOC_COLOURS.cstorm_transparent = G.C.CSTORM.TRANSPARENT
    G.ARGS.LOC_COLOURS.cstorm_mod = G.C.CSTORM.MOD
    G.ARGS.LOC_COLOURS.cstorm_git = G.C.CSTORM.GIT
    G.ARGS.LOC_COLOURS.cstorm_xyz = G.C.CSTORM.XYZ
    G.ARGS.LOC_COLOURS.cstorm_buttons = G.C.CSTORM.BUTTONS
    G.ARGS.LOC_COLOURS.cstorm_con_buttons = G.C.CSTORM.CON_BUTTONS
    return loc_colour_ref(_c, _default)
end