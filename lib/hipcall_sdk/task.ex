defmodule HipcallSdk.Task do
  @moduledoc false

  alias HipcallSdk.Config

  @endpoint_url "tasks"

  @spec list(params :: keyword(), config :: map) ::
          {:ok, map()} | {:error, map()} | {:error, any()}
  def list(params, config \\ %Config{}) do
    Finch.build(
      :get,
      "#{url(config)}#{@endpoint_url}",
      header(config),
      body(params)
    )
    |> Finch.request(HipcallSdkFinch, receive_timeout: 600_000)
    |> case do
      {:ok, %Finch.Response{status: 200, body: body}} ->
        {:ok, body |> Jason.decode!()}

      {:ok, %Finch.Response{status: status, body: body, headers: headers}} ->
        {:error, %{status: status, body: body |> Jason.decode!(), headers: headers}}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp body(params) do
    params |> Enum.into(%{}) |> Jason.encode!()
  end

  defp url(config) do
    config.api_url || Config.api_url()
  end

  defp header(config) do
    api_key = config.api_key || Config.api_key()

    [
      {"Authorization", "Bearer #{api_key}"},
      {"content-type", "application/json"}
    ]
  end
end
