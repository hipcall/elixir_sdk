defmodule HipcallSdk do
  @moduledoc """
  Documentation for `HipcallSdk`.

  ## Tasks
  https://use.hipcall.com.tr/api-docs/#/Task

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

  @task_create_schema [
    name: [
      type: :string,
      doc: """
      Task name.
      """,
      required: true
    ],
    description: [
      type: :string,
      doc: """
      Task description.
      """
    ],
    assign_to_user_id: [
      type: :integer,
      doc: """
      Assign to user id.
      """
    ],
    auto_assign_to_user: [
      type: :boolean,
      doc: """
      Auto assign to user.
      """,
      default: false
    ],
    company_ids: [
      type: {:list, :integer},
      doc: """
      Company ids.
      """,
      default: []
    ],
    contact_ids: [
      type: {:list, :integer},
      doc: """
      Contact ids.
      """,
      default: []
    ],
    deal_ids: [
      type: {:list, :integer},
      doc: """
      Deal ids.
      """,
      default: []
    ],
    due_date: [
      type: :string,
      doc: """
      Due date.
      """
    ],
    priority: [
      type: :string,
      doc: """
      Task priority.
      """
    ],
    task_list_id: [
      type: :integer,
      doc: """
      Task task_list_id.
      """
    ]
  ]

  @doc """
  Get task list

  ## Examples

      iex> task_list_params = [limit: 10, offset: 1, sort: "id.asc"]
      iex> HipcallSdk.task_list(task_list_params)

  ## Arguments

  #{NimbleOptions.docs(@task_list_schema)}

  ## Options

  - config :: struct()

  ## Raises

  There is no exception.

  ## Returns

  {:ok, map()} | {:error, map()} | {:error, any()}

  """
  @spec task_list(params :: keyword(), config :: struct()) ::
          {:ok, map()} | {:error, map()} | {:error, any()}
  def task_list(params, config \\ %Config{}) when is_struct(config) do
    NimbleOptions.validate!(params, @task_list_schema)
    Task.list(params, config)
  end

  @doc """
  Get task

  ## Examples

      iex> HipcallSdk.task_get(11184)
      {:ok,
      %{
        "data" => %{
          "assign_to_user_id" => 826,
          "description" => "Task description",
          "done" => false,
          "done_at" => nil,
          "due_date" => nil,
          "id" => 11184,
          "name" => "Follow up",
          "priority" => "medium"
        }
      }}

  ## Arguments

  - id :: pos_integer()
  - config :: struct()

  ## Options

  There is no options.

  ## Raises

  There is no exceptions.

  ## Returns

  - {:ok, map()} | {:error, map()} | {:error, any()}

  """
  @spec task_get(id :: pos_integer(), config :: struct()) ::
          {:ok, map()} | {:error, map()} | {:error, any()}
  def task_get(id, config \\ %Config{}) when is_struct(config) do
    Task.get(id, config)
  end

  @doc """
  Create a new docs

  ## Examples

      iex> task_create_params = [name: "Task 1", description: "Task one description", auto_assign_to_user: true]
      iex> HipcallSdk.task_create(task_create_params)
      ...> {:ok,
      ...>   %{
      ...>     "data" => %{
      ...>       "assign_to_user_id" => nil,
      ...>       "description" => "Task one description",
      ...>       "done" => false,
      ...>       "done_at" => nil,
      ...>       "due_date" => nil,
      ...>       "id" => 11440,
      ...>       "name" => "Task 1",
      ...>       "priority" => nil
      ...>     }
      ...>   }}

  ## Arguments

      #{NimbleOptions.docs(@task_create_schema)}

  ## Options

  - config :: struct()

  ## Raises

  There is no exception.

  ## Returns

  {:ok, map()} | {:error, map()} | {:error, any()}

  """
  @spec task_create(params :: map(), config :: struct()) ::
          {:ok, map()} | {:error, map()} | {:error, any()}
  def task_create(params, config \\ %Config{}) when is_struct(config) do
    NimbleOptions.validate!(params, @task_create_schema)
    Task.create(params, config)
  end
end
