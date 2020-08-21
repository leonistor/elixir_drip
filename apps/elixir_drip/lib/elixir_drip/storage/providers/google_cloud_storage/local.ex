defmodule ElixirDrip.Storage.Providers.GoogleCloudStorageLocal do
  @behaviour ElixirDrip.Behaviours.StorageProvider

  require Logger

  def upload(path, content) do
    Logger.debug("Uploading #{inspect(byte_size(content))} bytes to GoogleCloudStorage, path: #{path}")
    {:ok, :uploaded}
  end

  def download(path) do
    Logger.debug("Downloading #{path} from GoogleCloudStorage")
    {:ok, "downloaded_content"}
  end
end
