defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.inspect(conn.assigns)
    IO.inspect(params)
    text conn, "Unimplemented"
  end
end
