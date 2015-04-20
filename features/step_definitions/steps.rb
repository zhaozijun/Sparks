Given(/^I'm on the author creation page$/) do
  visit(new_author_registration_path)
end

When(/^I add new author$/) do
  fill_in 'Name', :with => "zzj"
  fill_in 'Email', :with => "zzj@upenn.com"
  fill_in 'Password', :with => "000000", :match => :prefer_exact
  fill_in 'Password confirmation', :with => "000000", :match => :prefer_exact
  click_button 'Sign up'
end

Then(/^I should be able to see the new author's homepage$/) do
  page.has_content?("Welcome! You have signed up successfully.")
end

Given(/^I'm on the signin page$/) do
  visit(new_author_session_path)
end

When(/^I login by using right email and password$/) do
  fill_in 'Email', :with => "zzj@upenn.com"
  fill_in 'Password', :with => "000000"
  click_button 'Log in'
end

Then(/^I should be able to see my page$/) do
  page.has_content?("Signed in successfully.")
end

Given(/^I'm on the logout page$/) do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/accounts/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end

Then(/^I should be able to go back to signin page$/) do
  page.has_content?("Signed out successfully.")
end

When(/^I login by using wrong email or password$/) do
  fill_in 'Email', :with => "zzj@upenn.com"
  fill_in 'Password', :with => "11111111"
  click_button 'Log in'
end

Then(/^I should not be able to see my page$/) do
  page.has_content?("Invalid email or password.")
end

Given(/^I'm on the user homepage$/) do
  visit(root_path)
end

Then(/^I should be able to see a list of papers from all authors$/) do
  page.has_content?("Listing papers")
end



#Given(/^I've successfully signed in$/) do
#  visit(new_author_session_path)
#  fill_in 'Email', :with => "zzj@upenn.com"
#  fill_in 'Password', :with => "000000"
#  click_button 'Log in' 
#  @author = Author.create(:email => "zzj@upenn.com", :password => "000000") 
#end

#Then(/^I want to create a new paper$/) do
#  visit(new_author_paper_path(@author))
#end

#When(/^I add a new title and upload files$/) do
#  fill_in 'Title', :with => "Scientific Research Sharing"
#  click_button 'Create Paper'
#end

#Then(/^I should be able to see the new paper's page$/) do
#  page.has_content?("Paper information")
#  page.has_content?("List Questions")
#end

#question steps
Given(/^I'm on the paper show page$/) do
visit(author_paper_path)
end
When(/^I click New Question button$/) do
click_button 'New Question'
end
Then(/^I should be able to see the new question's page$/) do  
assert page.has_content?("Please add your question:")
end

Given(/^I'm on the new question page$/) do
visit(new_paper_question_path)
end
When (/^I add a new answer$/) do
  fill_in 'Content', :with => "what is definition of Map reduce?"
  fill_in 'Answertext', :with => "it helps us to sort and search words efficiently."
  click_button 'Create Question'
end
Then (/^I should see a button to choose my anwser file$/) do
 assert page.has_selector?("input")
end

When(/^I add a new question without content$/) do
click_button 'Create Question'
end
Then(/^I should see some errors on the page$/) do
assert page.has_css?('div.field_with_errors')
end
#question end

