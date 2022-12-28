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

  def test_form_for_with_input_field
    user = User.new name: "rob", job: "hexlet"
    expected_html = read_fixture("form_input.html").gsub("\n", "")

    html = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
    end

    assert_equal expected_html, html
  end

  def test_form_for_with_fields
    user = User.new name: "rob", job: "hexlet"
    expected_html = read_fixture("form_input_textarea.html").gsub("\n", "")

    html = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal expected_html, html
  end

  def test_form_for_with_submit
    user = User.new job: "hexlet"
    expected_html = read_fixture("form_input_submit.html").gsub("\n", "")
    html = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal expected_html, html
  end
end
