defmodule BoxiconTest do
  use ExUnit.Case
  import Phoenix.LiveView.Helpers
  import Phoenix.LiveViewTest

  # The default endpoint for testing
  @endpoint Endpoint

  describe "Box.icons/1" do
    test "Simple case" do
      assigns = %{}

      html =
        rendered_to_string(~H"""
          <Box.icons
            type="regular"
            name="calendar"
            size="24"
            class="icon"
          />

        """)

      assert String.contains?(html, "M7 11h2v2H7zm0 4h2v2H7zm4-4h2v2h-2zm0")
      assert String.contains?(html, "class=\"")
      assert String.contains?(html, "height=\"")
      assert String.contains?(html, "width=\"")
      assert String.contains?(html, "<svg")
      assert String.contains?(html, "</svg>")
    end
  end

  test "Only name given" do
    assigns = %{}

    html =
      rendered_to_string(~H"""
        <Box.icons
          name="calendar"
        />

      """)

    assert String.contains?(html, "M7 11h2v2H7zm0 4h2v2H7zm4-4h2v2h-2zm0")
    assert String.contains?(html, "class=\"")
    assert String.contains?(html, "height=\"")
    assert String.contains?(html, "width=\"")
    assert String.contains?(html, "<svg")
    assert String.contains?(html, "</svg>")
  end
end
