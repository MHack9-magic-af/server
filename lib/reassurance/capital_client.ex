defmodule Reassurance.CapitalClient do

  #POST Requests here

  def create_account(cust_key, nickname, balance) do
    {:ok, resp} = HTTPoison.post "http://api.reimaginebanking.com/customers/#{cust_key}/accounts?key=e78adbd4ff38c82af6ab157e7d10070a", "{\"type\": \"Reassurance Payment\", \"balance\": \"#{balance}\", \"nickname\": \"#{nickname}\"}", [{"Content-Type", "application/json"}]
    resp
  end

  def create_customer(first_name, last_name) do
    {:ok, resp} = HTTPoison.post "http://api.reimaginebanking.com/customers?key=e78adbd4ff38c82af6ab157e7d10070a",
    """
      {
        "first_name": "#{first_name}",
        "last_name": "#{last_name}",
        "address": {
          "street_number": "string",
          "street_name": "string",
          "city": "string",
          "state": "FL",
          "zip": "33467"
        }
      }
      """, [{"Content-Type", "application/json"}]
    resp
  end

  def create_deposit(uid_key, amount) do
    {:ok, resp} = HTTPoison.post "http://api.reimaginebanking.com/accounts/#{uid_key}/deposits?key=e78adbd4ff38c82af6ab157e7d10070a", "{\"medium\": \"balance\", \"amount\": #{amount}}", [{"Content-Type", "application/json"}]
    resp
  end

  #PUT Requests here
  def update_account(uid_key, nickname, account_number) do
    {ok, resp} = HTTPoison.put "http://api.reimaginebanking.com/accounts/#{uid_key}?key=e78adbd4ff38c82af6ab157e7d10070a", "{\"nickname\": \"#{nickname}\", \"account_number\": \"#{account_number}\"}", [{"Content-Type", "application/json"}]
    resp
  end

  def update_deposit(deposit_key, amount) do
    {ok, resp} = HTTPoison.put "http://api.reimaginebanking.com/deposits/#{deposit_key}?key=e78adbd4ff38c82af6ab157e7d10070a", "{\"amount\": \"#{amount}\"}", [{"Content-Type", "application/json"}]
    resp
  end

  #DELETE requests here

  def delete_account(uid_key) do
    {ok, resp} = HTTPoison.delete "http://api.reimaginebanking.com/accounts/#{uid_key}?key=e78adbd4ff38c82af6ab157e7d10070a", [{"Content-Type", "application/json"}]
    resp
  end

  def delete_deposit(deposit_id) do
    {ok, resp} = HTTPoison.delete "http://api.reimaginebanking.com/deposits/#{deposit_id}?key=e78adbd4ff38c82af6ab157e7d10070a", [{"Content-Type", "application/json"}]
    resp
  end

  #GET Requests here
  def get_customer_uid(uid_key)  do
    {ok, resp} = HTTPoison.get "http://api.reimaginebanking.com/accounts/#{uid_key}/customer?key=e78adbd4ff38c82af6ab157e7d10070a", [{"Content-Type", "application/json"}]
    resp
  end

  def get_account(uid_key) do
    {ok, resp} = HTTPoison.get "http://api.reimaginebanking.com/enterprise/accounts/#{uid_key}?key=e78adbd4ff38c82af6ab157e7d10070a", [{"Content-Type", "application/json"}]
    resp
  end

  def get_deposit(deposit_key) do
    {ok, resp} = HTTPoison.post "http://api.reimaginebanking.com/enterprise/deposits/#{deposit_key}?key=e78adbd4ff38c82af6ab157e7d10070a", "{\"body\":}", [{"Content-Type", "application/json"}]
    resp
  end
end
