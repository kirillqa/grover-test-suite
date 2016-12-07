class User

  include CommonHelper

  attr_reader :first_name, :last_name, :email
  attr_accessor :password, :confirm_password

  def first_name=(value)
    @first_name = unique_value(value)
  end

  def last_name=(value)
    @last_name = unique_value(value)
  end

  def email=(value)
    @email = unique_value(value)
  end

end