ChipStorm = {}

local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers" )
local enhancement_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "enhancements" )
local consumable_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "consumables" )
local boosterpack_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "boosterpacks" )
local sticker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "stickers" )

assert(SMODS.load_file("globals.lua"))()


for _, file in ipairs(joker_src) do
    assert(SMODS.load_file("jokers/" .. file ))()
end

for _, file in ipairs(enhancement_src) do
    assert(SMODS.load_file("enhancements/" .. file ))()
end

for _, file in ipairs(consumable_src) do
    assert(SMODS.load_file("consumables/" .. file ))()
end

for _, file in ipairs(boosterpack_src) do
    assert(SMODS.load_file("boosterpacks/" .. file ))()
end

-- for _, file in ipairs(sticker_src) do
--     assert(SMODS.load_file("stickers/" .. file ))()
-- end
