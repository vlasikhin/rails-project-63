# frozen_string_literal: true

require 'test_helper'

class TestVersion < Minitest::Test
  def test_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end
end
