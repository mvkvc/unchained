defmodule Unchained.LM.Config do
  use Ecto.Schema
  import Ecto.Changeset
  alias Unchained.LM.Config.OpenAI

  @type t :: %__MODULE__{
          api_key: String.t(),
          model_name: String.t()
        }

  embedded_schema do
    field(:api_key, :string)
    field(:model_name, :string)

    embeds_one(:openai, OpenAI)
  end

  def changeset(config, attrs) do
    config
    |> cast(attrs, [:api_key, :model_name])
    |> validate_required([])
  end

  def changeset_openai(config, attrs) do
    config
    |> changeset(attrs)
    |> cast_embed(:openai)
  end
end
