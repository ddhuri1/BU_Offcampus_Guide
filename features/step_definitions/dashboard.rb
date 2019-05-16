When("I am on Dashboard") do
  #allow(User).to receive(:find).and_return(:user_id)
  #visit welcome_login_path
  page.should have_selector('h2', :text => "DASHBOARD") 
end

Then("I should see {string}") do |string|
  #visit dashboard_index_path
  if page.respond_to? :should
    page.should have_content(string)
  else
    assert page.has_content?(string)
  end
end