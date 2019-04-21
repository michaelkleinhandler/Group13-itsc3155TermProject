require 'rails_helper'
# require 'factories'
RSpec.describe "Sessions" do
  it "signs user in and out" do
    user = FactoryBot.create(:user)    ## uncomment if using FactoryBot
    #user = User.create(email: 'will@will.com', password: "g2c256zx2", password_confirmation: "g2c256zx2") ## uncomment if not using FactoryBot
    sign_in user
    get root_path
    expect(response).to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
    
    sign_out user
    get root_path
    expect(response).not_to render_template(:index) # add gem 'rails-controller-testing' to your Gemfile first.
  end
end