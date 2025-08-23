
SMODS.Atlas({
    key = "death",
    path = "death.png",
    px = 71,
    py = 95
})

SMODS.Sticker{
    key = "death",
    config = { extra = { roundsTillDeath = 3, roundsWithSticker = 0, roundsLeft = 3 } },
    badge_colour = HEX '000000',
    pos = { x = 0, y = 0 },
    default_compat = true,
    rate = 1.0,
    atlas = "death",
    unlocked = true,
    discovered = true,
    should_apply = function(self, card, center, area, bypass)
        if area == G.shop_jokers then
            return true
        end
        return false
    end,

    calculate = function (self, card, context)
        card.ability.cstorm_death.extra.roundsLeft = card.ability.cstorm_death.extra.roundsTillDeath - card.ability.cstorm_death.extra.roundsWithSticker
        if context.end_of_round and not context.repetition and not context.individual then
            card.ability.cstorm_death.extra.roundsWithSticker = card.ability.cstorm_death.extra.roundsWithSticker + 1
            print(card.ability.cstorm_death.extra.roundsWithSticker)
            if card.ability.cstorm_death.extra.roundsWithSticker == card.ability.cstorm_death.extra.roundsTillDeath then
                print("DEATH")
                G.STATE = G.STATES.GAME_OVER
                G.STATE_COMPLETE = false
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.cstorm_death.extra.roundsTillDeath, card.ability.cstorm_death.extra.roundsLeft }, key = self.key }
    end
}

-- Spawn-Conditions für den „3-Runden-Game-Over“-Sticker
-- 1. Progress-Gate

-- Frühestens ab Ante 3–4 (damit der Spieler schon ein paar Optionen & Ressourcen hat).
-- Alternativ erst nach dem ersten Boss oder ab einer bestimmten Chip-Score-Summe.

-- 2. Spawn-Chance

-- Sehr niedrig halten (z. B. 2–5 % pro Shop-Refresh).
-- Optional höhere Chance in höheren Antes (Risiko steigt mit Progress).

-- 3. Karten-Eignung

-- Nur auf seltenen / mächtigen Jokern – so ist es ein Deal with the Devil, nicht einfach ein Todesurteil.
-- Keine Starter- oder Low-Tier-Joker (sonst ist’s nur ein Troll-Move).

-- 4. Spawn-Orte

-- Shop (aber nur begrenzt)
-- Seltene Event-Belohnungen („Verfluchter Fund“)
-- Boss-Reward-Pools mit Warnhinweis

-- 5. Schutz vor Softlocks

-- Niemals auf allen angebotenen Jokern im Shop gleichzeitig (max. 1 pro Shop-Refresh).
-- Nicht in Situationen, wo der Spieler nur diesen Joker nehmen müsste, um weiterzukommen.

-- 💡 Extra-Idee fürs Balancing:
-- Man könnte noch eine Warning-UI einbauen: Wenn der Sticker im Shop auftaucht, 
-- knallt ein rotes Warnsymbol neben dem Joker, damit der Spieler nicht versehentlich einen Timer-Tod kauft,
-- weil er nur den Multiplikator gesehen hat.