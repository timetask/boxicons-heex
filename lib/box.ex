defmodule Box do
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
  require Logger

  use Phoenix.Component

  @icons Box.Source.get_icons()

  def icons(assigns) do
    assigns =
      assigns
      |> assign_new(:class, fn -> nil end)
      |> assign_new(:size, fn -> nil end)
      |> assign_new(:type, fn -> nil end)

    ~H[<svg xmlns="http://www.w3.org/2000/svg" width={"#{get_size(@size)}"} height={"#{get_size(@size)}"} class={"#{get_class(@class)}"} viewBox="0 0 24 24"><%= render_content(get_type(@type), @name) %></svg>]
  end

  Logger.debug(" - Compiling #{Enum.count(@icons)} boxicons.")

  for %Box.Source{type: type, name: name, content: content} <- @icons do
    defp render_content(unquote(Atom.to_string(type)), unquote(name)),
      do: unquote(Phoenix.HTML.raw(content))
  end

  defp render_content(_, _), do: "<404>"

  def get_size(size) do
    case size do
      nil -> Application.get_env(:boxicons_heex, :default_size, 24)
      _ -> size
    end
  end

  def get_class(class) do
    case class do
      nil -> Application.get_env(:boxicons_heex, :default_class, "icon")
      _ -> class
    end
  end

  def get_type(type) do
    case type do
      nil -> Application.get_env(:boxicons_heex, :default_type, "regular")
      _ -> type
    end
  end
end
