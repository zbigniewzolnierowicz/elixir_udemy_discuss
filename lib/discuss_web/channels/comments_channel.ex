defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  def join("comments:" <> topic_id, _payload, socket) do
    {:ok, %{foo: topic_id}, socket}
  end

  def handle_in() do

  end
end
