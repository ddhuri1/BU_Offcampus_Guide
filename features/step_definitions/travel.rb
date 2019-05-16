# And "I click on the travel" do

And "I click on the {string}" do |string|
  #@current_user=User.find(session[:user_id])
  #if session[:user_id]
  #User.create(id: user["id"])
    print string
    visit string
    click_link(string)

  #end
end

When "I click {string}" do |string|
    if(string == "Local" || string == "Bus" || string == "Airport" || string == "Car Rental")
        visit travel_path
        click_link(string)
    end
    if(string == "Grocery" || string == "Medical" || string == "Household" || string == "Clothing")
        visit essentials_path
        click_link(string);
    end
    
end

# When("I am on Travel Page") do
#   visit "/travel"
# end

#Then("I should be on the page with the title: TRAVEL") do
#    visit travel_path
#    click_link(travel_path)
#    page.should have_selector('h2', :text => "TRAVEL") 
#end

Then "I should be able to see {string}" do |string|
    # click_link(string)
    #page.should have_selector('h2', :text => "TRAVEL") 

    # print travel_path
    # print root_path
    # print essentials_path
    if page.respond_to? :should
        page.should have_content(string)
    else
        assert page.has_content?(string)
    end
end

