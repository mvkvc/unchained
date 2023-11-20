defmodule Unchained.LM.Config.OpenAI do
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          api_key: String.t(),
          model_name: String.t()
        }

  embedded_schema do
    field(:api_key, :string)
    field(:model_name, :string)
  end

  def changeset(config, attrs) do
    config
    |> cast(attrs, [:api_key, :model_name])
    |> validate_required([:api_key, :model_name])
  end
end
