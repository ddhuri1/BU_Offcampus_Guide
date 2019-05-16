When("I am on Home Page") do
  #require 'pry'; binding.pry
  visit welcome_login_path
  page.should have_selector('h2', :text => "Log in")
end

When("I click on {string}") do |string|
  if string == "Travel"
    visit travel_path
    click_link(string)
  else
    visit root_path
    click_link(string)   
  end
end

Then("I should be on the page with the title: Login Page") do
  page.should have_selector('h1', :text => "Login Page") 
end

Then("I should be on the page with the title: New User") do
  page.should have_selector('h1', :text => "New User")
end

Then("I should be on the page with the title: Guest Sign In") do
  page.should have_selector('h1', :text => "Guest Sign In")
end