$LOAD_PATH << File.dirname(__FILE__) + '/../lib'

ENVIRONMENT = (ENV['ENVIRONMENT'] || 'production').to_sym
Dir::mkdir('report') unless File.directory?('report')
raise "You need to create a configuration file named '#{ENVIRONMENT}.yml' under lib/config" unless File.exist? "#{File.dirname(__FILE__)}/../../lib/config/#{ENVIRONMENT}.yml"

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'faker'
require 'env_config'
require 'get_grover'
require 'pages'
require 'common_helper'
require 'objects/user'

World(CommonHelper)

@default_driver = (EnvConfig.get :default_driver)

Capybara.register_driver @default_driver do |app|
  Capybara::Selenium::Driver.new(app, browser: (EnvConfig.get :browser))
end

Capybara.configure do |config|

  config.default_driver = @default_driver
  config.javascript_driver = (EnvConfig.get :javascript_driver)

  config.run_server = (EnvConfig.get :run_server)
  config.default_selector = (EnvConfig.get :default_selector)
  config.default_max_wait_time = (EnvConfig.get :wait_time)
  config.app_host = (EnvConfig.get :app_url)

  # capybara 2.1 config options
  config.match = (EnvConfig.get :match)
  config.ignore_hidden_elements = (EnvConfig.get :ignore_hidden_elements)

end

# Generate unique value for test data
CommonHelper.random_string = Faker::Lorem.characters(4)

Before do
  page.driver.browser.manage.window.maximize
end

After do |scenario|

  if scenario.failed?
    Dir::mkdir('screenshots') unless File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.tr(' ' , '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    page.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
end
