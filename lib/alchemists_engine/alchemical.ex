defmodule AlchemistsEngine.Alchemical do
  alias AlchemistsEngine.Alchemical
  defstruct [:red, :green, :blue]

  def all() do
    [
      %Alchemical{
        red: %{sign: :plus, size: :large},
        green: %{sign: :plus, size: :large},
        blue: %{sign: :plus, size: :large}
      },
      %Alchemical{
        red: %{sign: :plus, size: :large},
        green: %{sign: :plus, size: :small},
        blue: %{sign: :minus, size: :small}
      },
      %Alchemical{
        red: %{sign: :plus, size: :small},
        green: %{sign: :minus, size: :small},
        blue: %{sign: :plus, size: :large}
      },
      %Alchemical{
        red: %{sign: :plus, size: :small},
        green: %{sign: :minus, size: :large},
        blue: %{sign: :minus, size: :small}
      },
      %Alchemical{
        red: %{sign: :minus, size: :small},
        green: %{sign: :plus, size: :large},
        blue: %{sign: :plus, size: :small}
      },
      %Alchemical{
        red: %{sign: :minus, size: :small},
        green: %{sign: :plus, size: :small},
        blue: %{sign: :minus, size: :large}
      },
      %Alchemical{
        red: %{sign: :minus, size: :large},
        green: %{sign: :minus, size: :small},
        blue: %{sign: :plus, size: :small}
      },
      %Alchemical{
        red: %{sign: :minus, size: :large},
        green: %{sign: :minus, size: :large},
        blue: %{sign: :minus, size: :large}
      }
    ]
  end

  def combine(
        %Alchemical{red: %{sign: r1}, green: %{sign: g1}, blue: %{sign: b1}},
        %Alchemical{red: %{sign: r2}, green: %{sign: g2}, blue: %{sign: b2}}
      )
      when r1 != r2 and g1 != g2 and b1 != b2 do
    :neutral
  end

  def combine(
        %Alchemical{red: %{sign: r1sign, size: r1size}},
        %Alchemical{red: %{sign: r2sign, size: r2size}}
      )
      when r1sign == r2sign and r1size != r2size do
    if r1sign == :plus, do: :r_plus, else: :r_minus
  end

  def combine(
        %Alchemical{green: %{sign: g1sign, size: g1size}},
        %Alchemical{green: %{sign: g2sign, size: g2size}}
      )
      when g1sign == g2sign and g1size != g2size do
    if g1sign == :plus, do: :g_plus, else: :g_minus
  end

  def combine(
        %Alchemical{blue: %{sign: b1sign, size: b1size}},
        %Alchemical{blue: %{sign: b2sign, size: b2size}}
      )
      when b1sign == b2sign and b1size != b2size do
    if b1sign == :plus, do: :b_plus, else: :b_minus
  end
end
