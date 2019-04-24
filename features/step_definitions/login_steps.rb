include Warden::Test::Helpers

Given("I am on the login screen") do
  visit root_path
end

When("I click on the {string} button") do |page_name|
  #user = FactoryBot.create(:user)
  #login_as(user, :scope => :user)
  click_on('Sign Up')
end

# Then("I click on the {string} button") do |string|
#   click_on('Sign in')
# end

Then("I should see the {string} buttons") do |page_name|
  page.should have_content("Sign up")
  page.should have_content("Email")
  page.should have_content ("Password")
end