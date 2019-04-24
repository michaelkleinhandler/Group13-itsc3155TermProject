Given("I am on the index screen") do
  visit 'welcome/index'
end

Then("I should click on the {string} button") do |string|
  click_on('Admin Portal')
end

Then("I should be on the index screen") do
  visit root_path
end

Then("I should see the {string} button") do |string|
  page.should have_content('Sign Up')
end