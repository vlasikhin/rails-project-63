# frozen_string_literal: true

require "test_helper"

class TestTag < Minitest::Test
  def test_tag_build
    assert_equal "<a href=\"https://hexlet.io\"></a>", HexletCode::Tag.build("a", href: "https://hexlet.io")
    assert_equal "<a href=\"https://hexlet.io\">Hexlet</a>", HexletCode::Tag.build("a", href: "https://hexlet.io") { "Hexlet" }
    assert_equal "<input />", HexletCode::Tag.build("input")
    assert_equal "<input type=\"submit\" />", HexletCode::Tag.build("input", type: "submit")
  end
end
