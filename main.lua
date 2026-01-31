-- ATLASES

SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

-- ASSERTS

assert(SMODS.load_file("src/jokers.lua"))()

-- Unsure what this does
local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end