require 'test/unit'
require 'xcider'

class TestXcodebuild < Test::Unit::TestCase

  #
  # Check if expected attributes do exist and can be written/read
  #
  def test_new

    #prepare
    expected_attributes=%w"workspace scheme configuration arch sdk dry_run last_command_string"

    #test
    # create instance and write values
    subject=Xcider::Xcodebuild.new.tap do |b|
      expected_attributes.each do |value|
        b.send("#{value}=", "#{value}_value")
      end
    end

    #verify
    # read attributes and check values
    expected_attributes.each do |value|
      assert_equal "#{value}_value", subject.send("#{value}")
    end

  end

  #
  # Test if can retrieve xcodebuild's version
  #
  def test_version

    #prepare
    subject=Xcider::Xcodebuild.new

    #test
    v=subject.version

    #verify
    assert_not_nil v

  end

  def test_build_opts

    #prepare
    expected_attributes=%w"workspace scheme configuration arch sdk dry_run"

    #test
    # create instance and write values
    subject=Xcider::Xcodebuild.new.tap do |b|
      expected_attributes.each do |value|
        b.send("#{value}=", "#{value}_v")
      end
    end

    #test
    subject.build

    #verify
    assert_equal "xcodebuild -dry-run -workspace \"workspace_v\" -scheme \"scheme_v\" -configuration \"configuration_v\" -arch \"arch_v\" -sdk \"sdk_v\"", subject.last_command_string

  end

end
