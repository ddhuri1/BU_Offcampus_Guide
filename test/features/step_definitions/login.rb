Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
   User.create(username: user["username"], password: user["password"], emailID: user["emailID"])
  end
end
   
Then("I should see {string}") do |string|
  if page.respond_to? :should
    page.should have_content(string)
  else
    assert page.has_content?(string)
  end
end

#And ("I fill in {string} with {value}") do |field, value|
 # page.fill_in 'emailID', :with => field
#  page.fill_in 'password', :with => value
#end

And ("I fill in right emailID") do
    page.fill_in "emailID", :with => "ddhuri@binghamton.edu"
end

And ("I fill in right password") do
  page.fill_in "password", :with => "ddhuri"
end

And ("I fill in wrong emailID") do
  page.fill_in "emailID", :with => "jstone1@binghamton.edu"
end

And ("I fill in wrong password") do
  page.fill_in "password", :with => "jstone1"
end
