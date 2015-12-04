defmodule AboutCannabis.Article do
  use AboutCannabis.Web, :model

  schema "articles" do
    field :title, :string
    field :body, :string
    field :slug, :string
    field :source, :string
    field :media, :string
    field :author, :string
    field :email, :string
    field :is_draft, :boolean, default: false
    field :is_public, :boolean, default: false

    timestamps
  end

  @required_fields ~w(title body slug source media author email is_draft is_public)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
