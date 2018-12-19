defmodule AutoShare.Source do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sources" do
    field :name, :string
    has_many :posts, AutoShare.Post

    timestamps()
  end

  @doc false
  def changeset(source, attrs) do
    source
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
