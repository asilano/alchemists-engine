defmodule AlchemistsEngine.FavourBehaviour do
  @callback name() :: String.t()
  @callback count() :: integer()
end

defmodule AlchemistsEngine.Favour do
  alias AlchemistsEngine.Favours

  def setup() do
    Enum.shuffle(all())
  end

  defp all() do
    [
      Favours.Assistant,
      Favours.Associate,
      Favours.Barmaid,
      Favours.Custodian,
      Favours.Herbalist,
      Favours.Merchant,
      Favours.Sage,
      Favours.Shopkeeper
    ]
    |> Enum.map(fn type -> Utils.repeat([type], type.count()) end)
    |> :lists.concat()
  end
end
