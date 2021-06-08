defmodule DiscussWeb.Plugs.RequireLoggedIn do
  import Plug.Conn
  alias Discuss.Repo
  alias Discuss.User
  alias DiscussWeb.Router.Helpers, as: Routes

  @spec init(any) :: any()
  def init(_params) do
  end

  @spec call(%Plug.Conn, any) :: %Plug.Conn
  def call(conn, _params) do
    if conn.assigns[:user_id] do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to do that.")
      |> redirect(to: Routes.topic_path(conn, :index))
      |> halt()
    end
  end
end
