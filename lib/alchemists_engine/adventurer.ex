defmodule AlchemistsEngine.Adventurer do
  alias AlchemistsEngine.Adventurer
  defstruct [:name, :left_potion, :mid_potion, :right_potion]

  def pick_for_setup() do
    all_adventurers() |> Enum.shuffle() |> Enum.take(5)
  end

  defp all_adventurers() do
    [
      {"Cleric", :b_plus, :r_plus, :g_plus},
      {"Ranger", :g_plus, :b_plus, :r_minus},
      {"Berserker", :r_plus, :g_plus, :b_minus},
      {"Sorcerer", :r_minus, :g_minus, :b_plus},
      {"Witcher", :g_minus, :b_minus, :r_plus},
      {"Assassin", :b_minus, :r_minus, :g_minus}
    ]
    |> Enum.map(fn {name, left, mid, right} ->
      struct(Adventurer, name: name, left_potion: left, mid_potion: mid, right_potion: right)
    end)
  end
end
