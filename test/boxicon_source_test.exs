defmodule BoxiconSourceTest do
  use ExUnit.Case

  test "get all icons" do
    icons = Box.Source.get_icons(:all)
    assert Enum.count(icons) == 1578

    for icon <- icons do
      assert Regex.match?(~r"^(<path|<circle|<defs|<polygon|<rect)", icon.content)
      assert String.length(icon.name) > 0
      assert icon.type in [:regular, :solid, :logos]
    end
  end

  test "get all regular icons" do
    icons = Box.Source.get_icons(regular: :all)
    assert Enum.count(icons) == 783
  end

  test "get only two icons" do
    icons = Box.Source.get_icons(regular: ["calendar"], solid: ["hand"])
    assert Enum.count(icons) == 2
  end
end
