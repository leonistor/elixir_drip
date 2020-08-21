defmodule ElixirDrip.Storage.Workers.CacheWorker do
  use GenServer

  def start_link(media_id, content) do
    GenServer.start_link(__MODULE__, content, name: name_for_media(media_id))
  end

  defp name_for_media(media_id) do
    {:global, {:cache, media_id}}
  end

  def init(content) do
    {:ok, %{hits: 0, content: content}}
  end

  def handle_call(:get_media, _from, %{hits: hits, content: content} = state) do
    {:reply, {:ok, content}, %{state | hits: hits + 1}}
  end
end
