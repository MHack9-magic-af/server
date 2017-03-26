defmodule Reassurance.TransactionController do
  use Reassurance.Web, :controller

  alias Reassurance.CapitalClient

  @our_account Application.get_env :capital_one, :account_id

  def deposit(conn, _) do
    #TODO: Make resp not suck
    resp = %{"balance" => 100}
    %{"balance" => balance, "id" => account_id } = resp

    balance
    |> calc_fee
    |> collect_fee(@our_account)
    |> make_deposit(account_id)

    conn
    |> send_resp(201, "")
  end

  defp collect_fee({balance, fee}, account_id) do
    create_transaction(account_id, amount)
    balance - fee
  end

  defp calc_fee(balance), do: {balance, balance * 5 / 100}

  defp make_deposit(amount, account_id) do
    create_deposit(account_id, amount)
  end
end
