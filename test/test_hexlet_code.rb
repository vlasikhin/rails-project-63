# frozen_string_literal: true

require "test_helper"

User = Struct.new(:name, :job, keyword_init: true)

class TestHexletCode < Minitest::Test
  def setup
    @user = User.new
  end

  def test_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_tag
    assert_equal '<form action="#" method="post"></form>', ::HexletCode.form_for(@user)
  end

  def test_form_tag_with_action
    assert_equal '<form action="/users" method="post"></form>', ::HexletCode.form_for(@user, url: "/users")
  end

  def test_form_tag_with_block
    assert_equal '<form action="#" method="post"></form>', ::HexletCode.form_for(@user) { |e| puts e }
  end
end
