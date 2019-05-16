When("I am on Dashboard") do
  #allow(User).to receive(:find).and_return(:user_id)
  #visit welcome_login_path
  
  click_link("Register or Log In With GitHub")
  print page.body
  page.should have_selector('h2', :text => "DASHBOARD") 
end

Then("I am on Dashboard") do
  print.page.body
end

Then("I should see {string}") do |string|
  if page.respond_to? :should
    if string == 'Travel'
      #click_link(string)
      page.visit(travel_path)
    end
    page.should have_content(string)
  else
    visit dashboard_index_path
    assert page.has_content?(string)
  end
end