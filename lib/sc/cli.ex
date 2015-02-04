defmodule SC.CLI do
  
  @moduledoc """
    This module is responsible for the communication with the command line
    It handles parameters parsing, and response formatting
  """

  def main(args) do
    case args |> parse do
      {:fetch_track, track}       -> fetch_track(track) |> print_track
      {:invalid_command, command} -> print_invalid_command(command)
      :help                       -> print_help
    end
  end


  @doc """
    Parses the ARGV and extract the operation to run

    iex> SC.CLI.parse ["track", "1234"]
    {:fetch_track, {:track_id, "1234"}}

    iex> SC.CLI.parse ["song", "toto - africa"]
    {:invalid_command, "song"}

    iex> SC.CLI.parse ["help"]
    :help

    iex> SC.CLI.parse []
    :help
  """
  def parse(["track", id]), do: {:fetch_track, {:track_id, id}}
  def parse(["help"]),      do: :help
  def parse([command | _]), do: {:invalid_command, command}
  def parse([]),            do: :help


  @doc """
    Fetches a track by id
  """
  def fetch_track({:track_id, track_id}) do
    SC.Client.get_track(track_id)
  end


  @doc """
    Prints a given track
  """
  def print_track({:track, fields}) do
    IO.puts "#{fields.id} : #{fields.title} (#{fields.artist}) | #{fields.permalink}"
  end


  @doc """
    Print the CLI instructions
  """
  def print_help do
    IO.puts """
      sc - soundcloud lightweight cli client

      COMMANDS
      * sc track <trackid> : displays the track details for the given id
    """
  end


  @doc """
    Print the error message when no valid command was entered
  """
  def print_invalid_command(command) do
    IO.puts """
      Command not recognized : #{command}.
      Use `sc help` for a list of available commands
    """
  end

end