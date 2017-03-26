defmodule Reassurance.Account do
  use Reassurance.Web, :model

  schema "accounts" do
    field :capital_one_id, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
