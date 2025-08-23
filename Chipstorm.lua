CSTORM = SMODS.current_mod
Chipstorm = {}

Chipstorm.config = SMODS.current_mod.config

local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers" )
local enhancement_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "enhancements" )
local edition_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "editions" )
local consumable_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "consumables" )
local boosterpack_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "boosterpacks" )
local blind_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "blinds" )
local back_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "backs" )
local sticker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "stickers" )
local shader_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "shaders" )
local tag_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "tags" )

assert(SMODS.load_file("globals.lua"))()
assert(SMODS.load_file("Atlas.lua"))()
assert(SMODS.load_file("newStuff.lua"))()
assert(SMODS.load_file("newStuff_UI.lua"))()
assert(SMODS.load_file("newStuff_functions.lua"))()
assert(SMODS.load_file("mod_info.lua"))()
assert(SMODS.load_file("general_ui.lua"))()


for _, file in ipairs(joker_src) do
    assert(SMODS.load_file("jokers/" .. file ))()
end

for _, file in ipairs(enhancement_src) do
    assert(SMODS.load_file("enhancements/" .. file ))()
end

for _, file in ipairs(edition_src) do
    assert(SMODS.load_file("editions/" .. file ))()
end

for _, file in ipairs(consumable_src) do
    assert(SMODS.load_file("consumables/" .. file ))()
end

for _, file in ipairs(boosterpack_src) do
    assert(SMODS.load_file("boosterpacks/" .. file ))()
end

for _, file in ipairs(blind_src) do
    assert(SMODS.load_file("blinds/" .. file ))()
end

for _, file in ipairs(back_src) do
    assert(SMODS.load_file("backs/" .. file ))()
end

-- for _, file in ipairs(sticker_src) do
--     assert(SMODS.load_file("stickers/" .. file ))()
-- end

for _, file in ipairs(shader_src) do
    assert(SMODS.load_file("shaders/" .. file ))()
end

for _, file in ipairs(tag_src) do
    assert(SMODS.load_file("tags/" .. file ))()
end
