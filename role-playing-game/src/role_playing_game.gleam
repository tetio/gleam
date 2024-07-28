import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health == 0, player.level >= 10 {
    True, True -> Some(Player(..player, health: 100, mana: Some(100)))
    True, False -> Some(Player(..player, health: 100))
    _, _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana, cost <= option.unwrap(player.mana, 0) {
    Some(a), True -> #(Player(..player, mana: Some(a - cost)), cost * 2)
    None, _ -> #(Player(..player, health: int.max(player.health - cost, 0)), 0)
    _, _ -> #(player, 0)
  }
}
