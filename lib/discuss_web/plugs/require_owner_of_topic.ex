defmodule DiscussWeb.Plugs.RequireLoggedIn do
  import Plug.Conn
  import Phoenix.Controller
  alias Discuss.Repo
  alias Discuss.User
  alias DiscussWeb.Router.Helpers, as: Routes

  def init(_params) do
  end

  def call(conn, _params) do
  end
end
