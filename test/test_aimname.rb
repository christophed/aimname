require 'test/unit'
require 'aimname'

class AimNameTest < Test::Unit::TestCase
  def test_new_aimname
    assert AimName.new
  end
end

