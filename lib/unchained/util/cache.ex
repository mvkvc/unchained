defmodule Unchained.Util.Cache do
  @moduledoc """
  Cache unique to each running function type. For example if you are running code then no need to run the same program again. For other things ex. fetching some internet data maybe you do want to cache but with expiry. Each function type should define its own cache and they are shared between all instances.
  """
  # TODO: Think about edge cases that might break this
end
