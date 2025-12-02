CSTORM = SMODS.current_mod
Chipstorm = {}
CSTORM.NEW = {}
CSTORM_UTIL = {}

Chipstorm.config = SMODS.current_mod.config

local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers" )
local rarity_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/rarities" )

assert(SMODS.load_file("src/globals.lua"))()
assert(SMODS.load_file("src/Atlas.lua"))()
assert(SMODS.load_file("src/mod_info.lua"))()
assert(SMODS.load_file("src/general_ui.lua"))()
assert(SMODS.load_file("src/functions.lua"))()
assert(SMODS.load_file("src/riddles.lua"))()


for _, file in ipairs(joker_src) do
    assert(SMODS.load_file("src/jokers/" .. file ))()
end

for _, file in ipairs(rarity_src) do
    assert(SMODS.load_file("src/rarities/" .. file ))()
end
