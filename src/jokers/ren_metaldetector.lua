SMODS.Atlas({
    key = "ren_metaldetector", 
    path = "jokers/ren_metaldetector.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

local weighted_random = function(pool)
    local poolsize = 0
    for k,item in pairs(pool) do
        poolsize = poolsize + item.weight
    end
    local selection = pseudorandom("ren_metaldetector", 1, poolsize)
    for k,item in pairs(pool) do
        selection = selection - item.weight
        if selection <= 0 then
            return item
        end
    end
end

local clone_table = function(tbl)
    local copy = {}
    for k,v in pairs(tbl) do
        copy[k] = v
    end
    return copy
end

local orig_card_drag = Card.drag
function Card:drag()
    if self.area and self.area == G.jokers then
        SMODS.calculate_context({smallpox_ren_dragging = true, card_dragging = self})
    end
    local ret = orig_card_drag(self)
    return ret
end

SMODS.Joker {
    key = "ren_metaldetector",
    atlas = "ren_metaldetector",
    pos = {x=0,y=0},
    rarity = 1,
    cost = 5,
    pools = {["Smallpox"] = true, ["Metallic"] = true},
    blueprint_compat = false,
    discovered = true,
    unlocked = true,
    config = {
        extra = {
            treasures = {},
            treasures_size = 3,
            loot_pool = {
                -- money
                {money = 1, weight = 1000},
                {money = 2, weight = 500},
                {money = 3, weight = 250},
                {money = 10, weight = 50},
                {money = 20, weight = 25},
            },
            collection_progress = 0,
            sound_ticks = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {}}
    end,
    calculate = function(self,card,context)
        if context.setting_blind and #card.ability.extra.treasures < card.ability.extra.treasures_size then
            for i = 1, card.ability.extra.treasures_size - #card.ability.extra.treasures do
                local loot = clone_table(weighted_random(card.ability.extra.loot_pool))
                loot.x = pseudorandom("ren_metaldetector") * (G.ROOM.T.w - G.CARD_W)
                loot.y = pseudorandom("ren_metaldetector") * (G.ROOM.T.h - G.CARD_H)
                table.insert(card.ability.extra.treasures, loot)
            end    
        end

        if context.smallpox_ren_dragging and context.card_dragging == card and #card.ability.extra.treasures > 0 then
            local closest_index = nil
            local closest_dist = nil
			
            for i, v in ipairs(card.ability.extra.treasures) do
                if (not closest_dist) or math.sqrt(((v.x - card.CT.x) ^ 2) + ((v.y - card.CT.y) ^ 2)) < closest_dist then
                    closest_index = i
                    closest_dist = math.sqrt(((v.x - card.CT.x) ^ 2) + ((v.y - card.CT.y) ^ 2))
                end
            end

            local collection_range = 0.75
            local detection_range = 5

            local max_juice_strength = 0.75
            local juice_mult = max_juice_strength/detection_range

			if closest_dist < detection_range then
				card.ability.extra.sound_ticks = card.ability.extra.sound_ticks + 0.1

				local interval = math.max(0.25, closest_dist) -- cap speed to avoid glitch

				if card.ability.extra.sound_ticks > interval then
					card.ability.extra.sound_ticks = 0
					play_sound("multhit1", 1.5, math.max(0,math.min(1, (detection_range - closest_dist) / detection_range)))--wrap the volume between 0 and 1
				end
			else
				-- reset ticks when out of range, to avoid glitch
				card.ability.extra.sound_ticks = 0
			end


            if not card.juice and closest_dist < detection_range then
                card:juice_up(math.max(0,detection_range-closest_dist)*juice_mult,math.max(0,detection_range-closest_dist)*juice_mult)
            end

            if closest_dist <= collection_range then
                card.children.center:set_sprite_pos({x=1,y=0})
                card.ability.extra.collection_progress = card.ability.extra.collection_progress + 0.1
                if card.ability.extra.collection_progress >= 5 then
                    card.ability.extra.collection_progress = 0
                    -- print(card.ability.extra.treasures[closest_index]) -- CHANGE THIS TO ACTUALLY GIVE THE THING
                    local treasure = card.ability.extra.treasures[closest_index]
                    if treasure.money then
                        ease_dollars(treasure.money)
                    end
                    if treasure.card and #G.jokers.cards < G.jokers.config.card_limit then --if space
                        SMODS.add_card({key = treasure.card})
                        --create card
                    elseif treasure.card then --if not grant joker value
						ease_dollars(math.floor(((10 - treasure.weight)/2)*0.8)) --reverse of weight calc, x0.8
					end

                    table.remove(card.ability.extra.treasures,closest_index)
                    card.children.center:set_sprite_pos({x=0,y=0})
                end
            else
                card.ability.extra.collection_progress = 0
                card.children.center:set_sprite_pos({x=0,y=0})
            end
        end
    end,
    add_to_deck = function(self,card,from_debuff)

        for _, center in ipairs(G.P_CENTER_POOLS.Metallic) do
            if center and center.key then
                table.insert(card.ability.extra.loot_pool, {
                    card = center.key,
                    weight = math.max(1, (center.cost * -2) + 10)
                })
            end
        end

        for i = 1, card.ability.extra.treasures_size do
            local loot = clone_table(weighted_random(card.ability.extra.loot_pool))
            loot.x = pseudorandom("ren_metaldetector") * (G.ROOM.T.w - G.CARD_W)
            loot.y = pseudorandom("ren_metaldetector") * (G.ROOM.T.h - G.CARD_H)
            table.insert(card.ability.extra.treasures, loot)
        end
    end,
    smallpox_credits = {
    	{
    		text = "By: PokéRen",
            color = G.C.BLUE
    	},
    },
}
