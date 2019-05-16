Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
   User.create(id: user["id"], email: user["email"])
  end
end
   
# Then("I should see {string}") do |string|
#   if page.respond_to? :should
#     page.should have_content(string)
#   else
#     assert page.has_content?(string)
#   end
# end

Given /^I am signed in with provider "(.*)"$/ do |provider|
  visit welcome_login_path
  click_link("Register or Log In With #{provider}")
end






And ("I signin with invalid account") do
  #page.fill_in "email", :with => "jstone1@binghamton.edu"
end


And /I click on "Register or Log In With Facebook"/ do |user|
  User.create(id: user["id"])
  visit dashboard_index_path
  page.should have_selector('h2', :text => "DASHBOARD") 
end

When /^I login with facebook/ do
  click_link("Register or Login with Facebook")
  page.should have_selector('h2', :text => "DASHBOARD")
end

#And ("I fill in {string} with {value}") do |field, value|
 # page.fill_in 'emailID', :with => field
#  page.fill_in 'password', :with => value
#end
