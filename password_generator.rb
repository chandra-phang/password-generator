# frozen_string_literal: true

require 'date'

ALPHABET_TO_NUMBER_MAPPING = {
  '@' => 0,
  'a' => 1,
  'b' => 2,
  'c' => 3,
  'd' => 4,
  'e' => 5,
  'f' => 6,
  'g' => 7,
  'h' => 8,
  'i' => 9,
  'j' => 10,
  'k' => 11,
  'l' => 12,
  'm' => 13,
  'n' => 14,
  'o' => 15,
  'p' => 16,
  'q' => 17,
  'r' => 18,
  's' => 19,
  't' => 20,
  'u' => 21,
  'v' => 22,
  'w' => 23,
  'x' => 24,
  'y' => 25,
  'z' => 26
}.freeze

EMAIL_REGEX = /\A([\w+-].?)+@[a-z\d-]+(\.[a-z]+)*\.[a-z]+\z/i

# PasswordGenerator generates a unique "temporary password" using the user's date of birth and email address
class PasswordGenerator
  def initialize(email: '', dob: '')
    @email = email
    @dob = dob
  end

  def run!
    return unless valid_email?
    return unless valid_dob?

    @mapping = generate_email_alphabet_mapping

    password = generate_password
    puts password
    password
  end

  def valid_email?
    unless @email.match(EMAIL_REGEX)
      puts 'email is invalid!'
      return false
    end

    true
  end

  def valid_dob?
    Date.iso8601(@dob.to_s)
    true
  rescue ArgumentError
    puts 'date of birth is invalid'
    false
  end

  def generate_email_alphabet_mapping
    mapping = {}
    alphabets = @email.split('').uniq - ['.']
    alphabets.each do |alphabet|
      number = ALPHABET_TO_NUMBER_MAPPING[alphabet]
      mapping[number] = alphabet
    end
    mapping
  end

  def generate_password
    password = ''
    dob = Date.iso8601(@dob)
    year_numbers = dob.year.to_s.split('').map(&:to_i)
    year_numbers.each do |number|
      password += get_alphabet_by_number_mapping(number)
    end

    password += get_alphabet_by_number_mapping(dob.month)
    password += get_alphabet_by_number_mapping(dob.day)
  end

  def get_alphabet_by_number_mapping(number)
    return @mapping[number].upcase if @mapping[number]

    index = 1
    until index == 25
      return @mapping[number - index] if @mapping[number - index]
      return @mapping[number + index] if @mapping[number + index]

      index += 1
    end

    ''
  end
end
