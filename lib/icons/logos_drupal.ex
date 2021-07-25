defmodule Boxicon.LogosDrupal do
  use Surface.Component

  @doc "Name as described in https://boxicons.com/"
  prop name, :string, required: true

  @doc "Width & height of the icon"
  prop size, :integer, default: 24

  @doc "CSS classes for the wrapping svg element"
  prop class, :string, default: ""

  @impl true
  def render(assigns) do
    ~F"""
      <svg xmlns="http://www.w3.org/2000/svg" width={"#{@size}"} height={"#{@size}"} viewBox="0 0 24 24"><path d="M11.474 14.42a3.162 3.162 0 1 0 0 6.324 3.162 3.162 0 0 0 0-6.324zm3.936-.606a5.433 5.433 0 0 1 1.513 3.769 5.441 5.441 0 0 1-2.335 4.47c2.609-.803 4.771-2.767 5.737-5.142 1.338-3.288.09-5.761-1.999-8.005.066.288.103.592.103.898a4.175 4.175 0 0 1-3.019 4.01zm-3.577-4.003c0 1.34 1.087 2.419 2.42 2.419s2.423-1.087 2.423-2.419a2.418 2.418 0 0 0-2.417-2.417 2.425 2.425 0 0 0-2.426 2.417z"/><path d="M7.303 21.093a5.435 5.435 0 0 1-1.276-3.51 5.441 5.441 0 0 1 4.8-5.408 4.162 4.162 0 0 1 3.99-6.492c-1.361-1.176-2.724-2.369-3.799-3.672.547 5.714-5.2 3.638-7.332 8.904-1.422 3.527-.138 7.892 3.617 10.178z"/></svg>
    """
  end

end