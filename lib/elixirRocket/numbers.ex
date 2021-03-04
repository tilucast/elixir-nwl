defmodule ElixirRocket.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file}) do
    result =
      file
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()
    {:ok, %{result: result}}
  end

  defp handle_file({:error, _error}), do: {:error, %{message: "Invalid file."}}
end
