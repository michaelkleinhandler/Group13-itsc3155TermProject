Given("I am on an index screen") do
  visit 'welcome/index'
end

Then("I should click on the {string} button") do |string|
  click_on('Admin Portal')
end

Then("I should be on an index screen") do
  visit root_path
end

Then("I should see a {string} button") do |string|
  page.should have_content('Sign Up')
end