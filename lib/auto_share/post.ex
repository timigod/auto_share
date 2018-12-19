defmodule AutoShare.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :can_share, :boolean, default: false
    field :description, :string
    field :title, :string
    field :url, :string
    belongs_to :source, AutoShare.Source

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :url, :description, :can_share])
    |> validate_required([:title, :url, :description, :can_share])
  end
end
