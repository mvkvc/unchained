defmodule Unchained.Function.Config do
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          timeout: integer(),
          max_retries: integer()
        }

  embedded_schema do
    field(:timeout, :integer)
    field(:max_retries, :integer)
  end

  def changeset(config, params) do
    config
    |> cast(params, [:timeout, :max_retries])
    |> validate_required([:timeout, :max_retries])
  end
end
