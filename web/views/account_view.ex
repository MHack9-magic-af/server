defmodule Reassurance.AccountView do
  use Reassurance.Web, :view

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, Reassurance.AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, Reassurance.AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{id: account.id}
  end
end
