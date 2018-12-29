require 'bcrypt'
require'pry'

class User
  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    User.switch_database
    result = @connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password']) }
  end

  def self.create(options)
    User.switch_database
    result = @connection.exec("SELECT * FROM users WHERE (email) = '#{options[:email]}'")
    return if result.any?
    password = BCrypt::Password.create(options[:password])
    result = @connection.exec("INSERT INTO users (email, password) VALUES('#{options[:email]}', '#{password}') RETURNING id, email")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    User.switch_database
    result = @connection.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.authenticate(email:, password:)
    User.switch_database
    result = @connection.exec("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  private

  def self.switch_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'Rate_My_Book_test')
    else
      @connection = PG.connect(dbname: 'Rate_My_Book')
    end
  end
end