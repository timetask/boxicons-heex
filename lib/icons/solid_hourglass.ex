defmodule Boxicon.SolidHourglass do
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
      <svg xmlns="http://www.w3.org/2000/svg" width={"#{@size}"} height={"#{@size}"} viewBox="0 0 24 24"><path d="M19 22h1v-2h-1v-1a7.014 7.014 0 0 0-3.433-6.02c-.355-.21-.567-.547-.567-.901v-.158c0-.354.212-.691.566-.9A7.016 7.016 0 0 0 19 5V4h1V2H4v2h1v1a7.016 7.016 0 0 0 3.434 6.021c.354.209.566.545.566.9v.158c0 .354-.212.691-.566.9A7.016 7.016 0 0 0 5 19v1H4v2h15zM17 4v1a5.005 5.005 0 0 1-1.004 3H8.004A5.005 5.005 0 0 1 7 5V4h10zM9.45 14.702c.971-.574 1.55-1.554 1.55-2.623V12h2v.079c0 1.068.579 2.049 1.551 2.623A4.98 4.98 0 0 1 16.573 17H7.427a4.977 4.977 0 0 1 2.023-2.298z"/></svg>
    """
  end

end