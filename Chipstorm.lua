CSTORM = SMODS.current_mod
Chipstorm = {}

Chipstorm.config = SMODS.current_mod.config

local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/jokers" )
local enhancement_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/enhancements" )
local edition_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/editions" )
local consumable_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/consumables" )
local boosterpack_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/boosterpacks" )
local blind_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/blinds" )
local back_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/backs" )
local sticker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/stickers" )
local shader_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/shaders" )
local tag_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/tags" )
local rank_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "src/ranks" )

assert(SMODS.load_file("src/globals.lua"))()
assert(SMODS.load_file("src/Atlas.lua"))()
assert(SMODS.load_file("src/newStuff.lua"))()
assert(SMODS.load_file("src/newStuff_UI.lua"))()
assert(SMODS.load_file("src/newStuff_functions.lua"))()
assert(SMODS.load_file("src/mod_info.lua"))()
assert(SMODS.load_file("src/general_ui.lua"))()


for _, file in ipairs(joker_src) do
    assert(SMODS.load_file("src/jokers/" .. file ))()
end

for _, file in ipairs(enhancement_src) do
    assert(SMODS.load_file("src/enhancements/" .. file ))()
end

for _, file in ipairs(edition_src) do
    assert(SMODS.load_file("src/editions/" .. file ))()
end

for _, file in ipairs(consumable_src) do
    assert(SMODS.load_file("src/consumables/" .. file ))()
end

for _, file in ipairs(boosterpack_src) do
    assert(SMODS.load_file("src/boosterpacks/" .. file ))()
end

for _, file in ipairs(blind_src) do
    assert(SMODS.load_file("src/blinds/" .. file ))()
end

for _, file in ipairs(back_src) do
    assert(SMODS.load_file("src/backs/" .. file ))()
end

-- for _, file in ipairs(sticker_src) do
--     assert(SMODS.load_file("src/stickers/" .. file ))()
-- end

for _, file in ipairs(shader_src) do
    assert(SMODS.load_file("src/shaders/" .. file ))()
end

for _, file in ipairs(tag_src) do
    assert(SMODS.load_file("src/tags/" .. file ))()
end

-- for _, file in ipairs(rank_src) do
--     assert(SMODS.load_file("src/ranks/" .. file ))()
-- end
