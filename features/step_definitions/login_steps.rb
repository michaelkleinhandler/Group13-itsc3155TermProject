include Warden::Test::Helpers

Given("I am on the login screen") do
  visit root_path
end

When("I fill out the username and password") do
  #user = FactoryBot.create(:user)
  #login_as(user, :scope => :user)
  fill_in 'Email', with: 'will@will.com'
  fill_in 'Password', with: 'g2c256zx2'
end

Then("I click on the {string} button") do |string|
  click_on('Sign in')
end

Then("I should see the {string} button") do |string|
  page.should have_content("My Classes")
end