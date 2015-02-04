defmodule SC do
  use Application

  def start(_type, _args) do
    # TODO : supervisor here

    SC.Client.start # No start_link?!

    {:ok, self}
  end

end
