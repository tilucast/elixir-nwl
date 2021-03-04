defmodule ElixirRocketWeb.AccountsController do
  use ElixirRocketWeb, :controller

  alias ElixirRocket.Account

  alias ElixirRocket.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback ElixirRocketWeb.FallbackController

  def deposit(connection, params) do
    with {:ok, %Account{} = account} <- ElixirRocket.deposit(params) do
      connection
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(connection, params) do
    with {:ok, %Account{} = account} <- ElixirRocket.withdraw(params) do
      connection
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(connection, params) do
    with {:ok, %TransactionResponse{} = transaction} <- ElixirRocket.transaction(params) do
      connection
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
