defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  import Ecto.Query, only: [from: 2]
  alias Discuss.Topic
  alias Discuss.Repo

  plug DiscussWeb.Plugs.RequireLoggedIn when action in [:new, :create, :edit, :update, :delete]

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, params)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => update_data}) do
    changeset =
      conn.assigns.user
      |> Ecto.build_assoc(:topics)
      |> Topic.changeset(update_data)

    case Repo.insert(changeset) do
      {:ok, _post} ->
        conn
        |> put_flash(:info, "You did it! You successfully made this topic!")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    text(conn, "good job")
  end

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render(conn, "index.html", topics: topics)
  end

  def delete(conn, %{"id" => id}) do
    Repo.get!(Topic, id) |> Repo.delete!()
    conn
    |> put_flash(:info, "Post with the ID of (#{id}) was successfully deleted.")
    |> redirect(to: Routes.topic_path(conn, :index))
  end

  def update(conn, %{"id" => id, "topic" => params}) do
    topic = Repo.get(Topic, id)
    changeset = Topic.changeset(topic, params)

    case Repo.update(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "You successfully edited the post with ID #{post.id}")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset} ->
        render(conn, "edit.html", topic: topic, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    topic = Repo.get(Topic, id)
    changeset = Topic.changeset(topic, %{})
    render(conn, "edit.html", topic: topic, changeset: changeset)
  end
end
