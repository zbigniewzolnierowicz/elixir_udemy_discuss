defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Topic
  alias Discuss.Repo

  def new_form(conn, params) do
    changeset = Topic.changeset(%Topic{}, params)
    render conn, "index.html", changeset: changeset
  end

  def create(conn, %{"topic" => update_data}) do
    changeset = Topic.changeset(%Topic{}, update_data)
    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} -> render conn, "index.html", changeset: changeset
    end
    text conn, "good job"
  end

  def index(conn, _params) do
    topics = Repo.all(Topic)

    render(conn, "topics.html", topics: topics)
  end

  def delete(conn, _params) do
    text conn, "Unimplemented"
  end

  def edit(conn, _params) do
    text conn, "Unimplemented"
  end

  def update_form(conn, _params) do
    text conn, "Unimplemented"
  end
end
