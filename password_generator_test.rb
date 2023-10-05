# frozen_string_literal: true

require './password_generator'
require 'test/unit'

# PasswordGenerator functionality test
class PasswordGeneratorTest < Test::Unit::TestCase
  def init_generator
    @generator = PasswordGenerator.new(email: 'ikhsan@jakpat.net', dob: '1980-07-15')
    @generator2 = PasswordGenerator.new(email: 'superadmin@jakpat.net', dob: '2001-10-31')
  end

  def test_valid_email?
    init_generator
    assert_equal(true, @generator.valid_email?)
    assert_equal(true, @generator2.valid_email?)
    assert_equal(false, PasswordGenerator.new(email: 'invalid_email').valid_email?)
  end

  def test_valid_dob?
    init_generator
    assert_equal(true, @generator.valid_dob?)
    assert_equal(true, @generator2.valid_dob?)
    assert_equal(false, PasswordGenerator.new(dob: 'invalid_date').valid_dob?)
  end

  def test_run!
    init_generator
    assert_equal('AIH@hn', @generator.run!)
    assert_equal('a@@AJu', @generator2.run!)
  end
end
