defmodule Unchained.LM.Model do
  alias Unchained.LM.Config
  alias Unchained.Util.Stream, as: UStream

  defstruct config: nil

  @type t :: %__MODULE__{
          config: Config.t()
        }

  @callback init(Config.t()) :: {:ok, __MODULE__.t()} | {:error, :term}
  @callback call(model :: __MODULE__.t(), text :: String.t()) ::
              {:ok, String.t()} | {:error, :term}
  @callback stream(model :: __MODULE__.t(), text :: String.t()) ::
              {:ok, UStream.t()} | {:error, :term}
end
