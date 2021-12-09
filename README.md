# Boxicon

Boxicons Heex is [Phoenix](https://github.com/phoenixframework/phoenix) component library that wraps the amazing [Boxicons](https://boxicons.com) library.

[![Hex pm](http://img.shields.io/hexpm/v/boxicons_heex.svg?style=flat)](https://hex.pm/packages/boxicons_heex) [![build](https://github.com/timetask/boxicons-heex/actions/workflows/build.yml/badge.svg)](https://github.com/timetask/boxicons-heex/actions/workflows/build.yml)

## Usage

```elixir
defmodule MyComponent do

  @impl true
  def render(assigns) do
    ~H"""
      <Box.icons
        type="regular"
        name="calendar"  
        size="64" 
        class="icon green"
      />
    """
  end
end
```

## Configuration

### Default values

Default values let you write your boxicons using less code.

```elixir
config :boxicons_heex,
  default_type: "regular",
  default_size: 24,
  default_class: "icon"
```

### Icons

By default Boxicon will compile all the 1500+ icons, which can take a while and will make you runtime
unnecessarily bloated. To fix this, you can specify the icons you want or an entire category.

This are some possible configurations:

Two regular icons, all the logos and none of the solid ones.
```elixir
config :boxicons_heex,
  icons: [
    regular: ["calendar", "chvron-down"],
    logos: :all,
    solid: nil
  ]
```

Just the icons you need (recommended)
```elixir
config :boxicons_heex,
  icons: [
    regular: ["calendar", "chvron-down"],
    solid: ["hand", "file-md"],
    logos: ["docker"]
  ]
```

Compile all the icons (default config)
```elixir
config :boxicons_heex,
  icons: :all
```

For the complete list of available icons visit the [boxicons wesite](https://boxicons.com).

## Installation

Add boxicons to your dependencies in your `mix.exs` file

```elixir
def deps do
  [
    {:boxicons_heex, "~> 1.0.0"}
  ]
end
```

Then run 

```
mix deps.get
```

and that's pretty much it.
