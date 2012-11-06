require 'test/unit'
require 'xcider'

class TestXcodeselect < Test::Unit::TestCase

  def test_version
    subject=Xcider::Xcodeselect.new
    assert_not_nil subject.version
    end

  def test_get_path
    subject=Xcider::Xcodeselect.new
    assert_not_nil subject.get_path
  end

end
