defmodule Servers.GameServer do
  use GenServer

  def start_link(initial_state \\ %{name: nil, gender: nil, cop_type: nil}) do
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

  def set_cop_type(cop_type) do
    GenServer.cast(:game_server, {:set_cop_type, cop_type})
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

  @impl true
  def handle_cast({:set_cop_type, cop_type}, state) do
    new_state = %{state | cop_type: cop_type}
    {:noreply, new_state}
  end

  def get_state do
    GenServer.call(:game_server, :get_state)
  end

  def get_name do
    GenServer.call(:game_server, :get_name)
  end

  def get_gender do
    GenServer.call(:game_server,:get_gender )
  end

  def get_cop_type do
    GenServer.call(:game_server, :get_cop_type)
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:get_name, _from, state) do
    {:reply, state.name, state}
  end

  @impl true
  def handle_call(:get_gender, _from, state) do
    {:reply, state.gender, state}
  end

  @impl true
  def handle_call(:get_cop_type, _from, state) do
    {:reply, state.cop_type, state}
  end
end
