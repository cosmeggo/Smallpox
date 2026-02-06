-- taken from cryptid
-- Pool used by Food Jokers
SMODS.ObjectType({
	key = "Food",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_gros_michel)
		self:inject_card(G.P_CENTERS.j_egg)
		self:inject_card(G.P_CENTERS.j_ice_cream)
		self:inject_card(G.P_CENTERS.j_cavendish)
		self:inject_card(G.P_CENTERS.j_turtle_bean)
		self:inject_card(G.P_CENTERS.j_diet_cola)
		self:inject_card(G.P_CENTERS.j_popcorn)
		self:inject_card(G.P_CENTERS.j_ramen)
		self:inject_card(G.P_CENTERS.j_selzer)
	end,
})

SMODS.ObjectType({
	key = "Disease",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_dna)
	end,
})

SMODS.ObjectType({
	key = "Landscape",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_dusk)
		self:inject_card(G.P_CENTERS.j_mystic_summit)
		self:inject_card(G.P_CENTERS.j_castle)
		self:inject_card(G.P_CENTERS.j_campfire)
		self:inject_card(G.P_CENTERS.j_shortcut)
		self:inject_card(G.P_CENTERS.j_hit_the_road)
		self:inject_card(G.P_CENTERS.j_satellite)
		self:inject_card(G.P_CENTERS.j_obelisk)
	end,
})

SMODS.ObjectType({
	key = "Meme",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_mr_bones)
		self:inject_card(G.P_CENTERS.j_four_fingers)
		self:inject_card(G.P_CENTERS.j_obelisk)
		self:inject_card(G.P_CENTERS.j_jolly)
		self:inject_card(G.P_CENTERS.j_space)
	end,
})

SMODS.ObjectType({
	key = "Scaling",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_hiker)
		self:inject_card(G.P_CENTERS.j_bootstraps)
		self:inject_card(G.P_CENTERS.j_burnt)
		self:inject_card(G.P_CENTERS.j_glass)
		self:inject_card(G.P_CENTERS.j_throwback)
		self:inject_card(G.P_CENTERS.j_flash)
		self:inject_card(G.P_CENTERS.j_perkeo)
		self:inject_card(G.P_CENTERS.j_bull)
		self:inject_card(G.P_CENTERS.j_trousers)
		self:inject_card(G.P_CENTERS.j_square)
		self:inject_card(G.P_CENTERS.j_vampire)
		self:inject_card(G.P_CENTERS.j_ride_the_bus)
		self:inject_card(G.P_CENTERS.j_egg)
		self:inject_card(G.P_CENTERS.j_runner)
		self:inject_card(G.P_CENTERS.j_constellation)
		self:inject_card(G.P_CENTERS.j_red_card)
		self:inject_card(G.P_CENTERS.j_hologram)
		self:inject_card(G.P_CENTERS.j_lucky_cat)
		self:inject_card(G.P_CENTERS.j_obelisk)
		self:inject_card(G.P_CENTERS.j_castle)
		self:inject_card(G.P_CENTERS.j_campfire)
		self:inject_card(G.P_CENTERS.j_hit_the_road)
		self:inject_card(G.P_CENTERS.j_wee)
		self:inject_card(G.P_CENTERS.j_caino)
		self:inject_card(G.P_CENTERS.j_yorick)
	end,
})

SMODS.ObjectType({
	key = "Smallpox_Pool",
	default = "j_joker",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "Rare_Smallpox_Pool",
	default = "j_smallpox_smallpox",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "Legendary_Smallpox_Pool",
	default = "j_smallpox_smallpox",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})
