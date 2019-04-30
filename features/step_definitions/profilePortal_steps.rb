Given("I am on an index screen of the application") do
  visit 'welcome/index'
end

Then("I click on the {string} button to sign up") do |string|
  click_on('Sign Up')
end

Then("I should be on the sign up screen") do
  visit '/my/users/sign_up'
end

