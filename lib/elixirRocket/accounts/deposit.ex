defmodule ElixirRocket.Accounts.Deposit do

    alias ElixirRocket.Accounts.Operations

    alias ElixirRocket.{Repo}

  def call(params) do
    params
    |> Operations.call(:deposit)
    |> run_transaction()
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{account_deposit: account}} -> {:ok, account}
    end
  end

end
