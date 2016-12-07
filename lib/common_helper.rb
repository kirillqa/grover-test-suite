module CommonHelper

  require 'rubygems'
  require 'active_support'

  mattr_accessor :random_string

  def unique_value(value)
    magic_word = 'pre-setup'
    if value.include? magic_word
      value.gsub("#{magic_word} ", '')
    elsif value.include? "empty"
      value.gsub("empty", '')
    else
      "#{value}_#{random_string}"
    end
  end

  def generate_not_supported_error(option)
    raise ArgumentError.new "message: #{option} option is not supported"
  end

end