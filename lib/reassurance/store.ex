defmodule Reassurance.Store do
  def start_link do
    Agent.start_link(__MODULE__, fn -> [] end)
  end

  def add_account(account) do
    Agent.update(__MODULE__, fn list -> list ++ [account] end)
  end
end
