defmodule Utils do
  def repeat(list, times) when is_list(list) and is_integer(times) and times > 0 do
    :lists.concat(List.duplicate(list, times))
  end
end
