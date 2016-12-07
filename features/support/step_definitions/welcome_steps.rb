Then(/^should see '(.*)' on welcome page/) do |text|
  expect(@welcome.welcome_text).to eq(text)
end

