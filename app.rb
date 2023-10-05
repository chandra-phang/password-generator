# frozen_string_literal: true

require './password_generator'

# application will run PasswordGenerator
class Application
  def run!
    email = input_email
    dob = input_dob
    PasswordGenerator.new(email:, dob:).run!
  end

  def input_email
    puts 'email:'
    gets.chomp.downcase
  end

  def input_dob
    puts 'date of birth:'
    gets.chomp
  end
end

app = Application.new
app.run!
