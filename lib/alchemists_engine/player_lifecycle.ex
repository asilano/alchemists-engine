defmodule AlchemistsEngine.PlayerLifecycle do
  use Fsmx.Fsm,
    transitions: %{
      "floating" => ["idle"],
      "idle" => []
    }
end
