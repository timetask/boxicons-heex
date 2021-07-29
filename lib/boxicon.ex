defmodule Boxicon do
  @moduledoc """
    Boxicon is surface component library that wraps the amazing boxicons library.

    Usage:

        defmodule MyComponent do
          use Surface.Component

          @impl true
          def render(assigns) do
            ~F"\""
              <Boxicon
                name="calendar"
                type="regular"
                size="64"
                class="icon green"
              />
            "\""
          end
        end


    To get a full list of all the available icons, go to https://boxicons.com/
  """

  use Surface.Component

  @doc "Type of the icon"
  prop type, :string, values!: ["solid", "regular", "logos"]

  @doc "Name of the icon"
  prop name, :string, required: true

  @doc "Width & height of the icon"
  prop size, :integer, default: 24

  @doc "CSS classes for the wrapping svg element"
  prop class, :string, default: "icon"

  @icons Boxicon.Source.get_icons()

  def render(assigns) do
    ~F[<svg xmlns="http://www.w3.org/2000/svg" width={"#{@size}"} height={"#{@size}"} class={"#{@class}"} viewBox="0 0 24 24">{render_content(@type, @name)}</svg>]
  end

  for %Boxicon.Source{type: type, name: name, content: content} <- @icons do
    defp render_content(unquote(Atom.to_string(type)), unquote(name)),
      do: unquote(Phoenix.HTML.raw(content))
  end

  defp render_content(_, _), do: "NOPE"
end
