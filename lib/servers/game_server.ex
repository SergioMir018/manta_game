defmodule Servers.GameServer do
  use GenServer

  def start_link(initial_state \\ %{name: nil, gender: nil}) do
    GenServer.start(__MODULE__, initial_state, name: :game_server)
  end

  @impl true
  def init(initial_state) do
    {:ok, initial_state}
  end

  def set_name(name) do
    GenServer.cast(:game_server, {:set_name, name})
  end

  def set_gender(gender) do
    GenServer.cast(:game_server, {:set_gender, gender})
  end

  @impl true
  def handle_cast({:set_gender, gender}, state) do
    new_state = %{state | gender: gender}
    {:noreply, new_state}
  end

  @impl true
  def handle_cast({:set_name, name}, state) do
    new_state = %{state | name: name}
    {:noreply, new_state}
  end

  def get_name do
    GenServer.call(:game_server, :get_name)
  end

  def get_gender do
    GenServer.call(:game_server,:get_gender )
  end

  @impl true
  def handle_call(:get_name, _from, state) do
    {:reply, state.name, state}
  end

  @impl true
  def handle_call(:get_gender, _from, state) do
    {:reply, state.gender, state}
  end
end
