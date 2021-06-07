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
      {:ok, _post} ->
        conn
        |> put_flash(:info, "You did it! You successfully made this topic!")
        |> redirect(to: Routes.topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "index.html", changeset: changeset
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

  def update(conn, %{"id" => id, "topic" => topic}) do
    IO.inspect(id)
    IO.inspect(topic)
    text conn, "Unimplemented"
  end

  def edit_form(conn, %{"id" => id}) do
    topic = Repo.get(Topic, id)
    changeset = Topic.changeset(topic, %{})
    render conn, "edit.html", topic: topic, changeset: changeset
  end
end
