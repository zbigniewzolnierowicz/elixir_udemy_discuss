defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  def join("comments:" <> topic_id, _payload, socket) do
    {:ok, %{topic_id: topic_id}, socket}
  end

  def handle_in("comments:" <> message_name, payload, socket) do
    IO.puts message_name
    IO.inspect payload
    {:reply, :ok, socket}
  end
end
