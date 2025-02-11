defmodule AlchemicalTest do
  alias AlchemistsEngine.Alchemical
  use ExUnit.Case
  doctest AlchemistsEngine.Alchemical

  test "it correctly mixes a red-plus potion" do
    left = %Alchemical{
      red: %{sign: :plus, size: :large},
      green: %{sign: :plus, size: :small},
      blue: %{sign: :minus, size: :small}
    }

    right = %Alchemical{
      red: %{sign: :plus, size: :small},
      green: %{sign: :minus, size: :large},
      blue: %{sign: :minus, size: :small}
    }

    assert Alchemical.combine(left, right) == :r_plus
  end

  test "it correctly mixes a green-minus potion" do
    left = %Alchemical{
      red: %{sign: :plus, size: :small},
      green: %{sign: :minus, size: :large},
      blue: %{sign: :minus, size: :small}
    }

    right = %Alchemical{
      red: %{sign: :plus, size: :small},
      green: %{sign: :minus, size: :small},
      blue: %{sign: :plus, size: :large}
    }

    assert Alchemical.combine(left, right) == :g_minus
  end

  test "it correctly mixes a blue-minus potion" do
    left = %Alchemical{
      red: %{sign: :plus, size: :small},
      green: %{sign: :minus, size: :large},
      blue: %{sign: :minus, size: :small}
    }

    right = %Alchemical{
      red: %{sign: :minus, size: :large},
      green: %{sign: :minus, size: :large},
      blue: %{sign: :minus, size: :large}
    }

    assert Alchemical.combine(left, right) == :b_minus
  end

  test "it makes soup in two different ways" do
    left = %Alchemical{
      red: %{sign: :plus, size: :small},
      green: %{sign: :minus, size: :large},
      blue: %{sign: :minus, size: :small}
    }

    right = %Alchemical{
      red: %{sign: :minus, size: :small},
      green: %{sign: :plus, size: :large},
      blue: %{sign: :plus, size: :small}
    }

    assert Alchemical.combine(left, right) == :neutral

    left = %Alchemical{
      red: %{sign: :plus, size: :large},
      green: %{sign: :plus, size: :large},
      blue: %{sign: :plus, size: :large}
    }

    right = %Alchemical{
      red: %{sign: :minus, size: :large},
      green: %{sign: :minus, size: :large},
      blue: %{sign: :minus, size: :large}
    }

    assert Alchemical.combine(left, right) == :neutral
  end
end
