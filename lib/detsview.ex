defmodule Detsview do
  def main(args) do
    args |> parse_opts |> process
  end

  def parse_opts([fname]), do: fname
  def parse_opts(_), do: raise "invalid arguments"

  def process(fname) do
    {:ok, table} = fname |> String.to_atom |> :dets.open_file
    data = :dets.foldl(fn item, acc -> [item|acc] end, [], table)
    :dets.close(table)
    IO.inspect data
  end
end
