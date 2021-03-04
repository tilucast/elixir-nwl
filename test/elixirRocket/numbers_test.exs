defmodule ElixirRocket.NumbersTest do
  use ExUnit.Case

  alias ElixirRocket.Numbers

  describe "sum_from_file/1" do
    test "when there is a file, sum all the numbers and return the result" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "when there isnt a file, return a map with an error message" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{message: "Invalid file."}}

      assert response == expected_response
    end
  end


end
