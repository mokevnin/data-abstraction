defmodule ExtEnum do
  def middle(list) do
    middle_index = round(length(list) / 2)
    Enum.at(list, middle_index)
  end
end

defmodule Main do
  def plural(str) do
    if String.ends_with?(str, "s"), do: str, else: "#{str}s"
  end

  def main do
    {:ok, files} = File.ls('.')

    files
    |> Enum.filter(&(!String.starts_with?(&1, ".")))
    |> Enum.sort()
    |> ExtEnum.middle()
    |> plural()
    |> String.upcase()
    |> IO.puts()
  end
end

Main.main()
