defmodule Discuss.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss.User
  alias Discuss.Topic

  schema "comments" do
    field :content, :string
    belongs_to :user, User
    belongs_to :topic, Topic
  end

  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
