defmodule Reassurance.Worker do
  def start_link do
    Task.async(check_for_updates())
  end

  defp check_for_updates do
    Stream.map(Agent.get(Reassurance.Store, &(&1)), fn acc ->
      if acc["threshold"] * acc["average_balance"] / 100 > acc["danger_zone"] do
        Task.async(&deposit_daily/1, [acc])
      end
    end)
    Process.sleep(2.628e9) #check again in a month
    check_for_updates()
  end

  defp deposit_daily(acc) do
    alias Reassurance.CapitalClient
    post_transfer(@our_account, acc["account_id"], acc["account_burnrate"])
  end
end
