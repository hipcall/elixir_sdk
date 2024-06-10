defmodule HipcallSdk do
  @moduledoc """
  Documentation for `HipcallSdk`.
  """

  alias HipcallSdk.Config
  alias HipcallSdk.Task

  @task_list_schema [
    limit: [
      type: :integer,
      doc: """
      Pagination limit.
      """,
      default: 10
    ],
    offset: [
      type: :integer,
      doc: """
      Pagination offset.
      """,
      default: 1
    ],
    q: [
      type: :string,
      doc: """
      Search query.
      """
    ],
    sort: [
      type: :string,
      doc: """
      Sort options.
      """,
      default: "id.asc"
    ]
  ]

  @spec task_list(params :: keyword(), config :: struct()) :: {:ok, map()} | {:error, map()} | {:error, any()}
  def task_list(params, config \\ %Config{}) when is_struct(config) do
    NimbleOptions.validate!(params, @task_list_schema)
    Task.list(params, config)
  end
end
