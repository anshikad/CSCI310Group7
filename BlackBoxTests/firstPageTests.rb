Given(/^I am on "([^"]*)"$/) do |arg1|
  visit arg1
end

Then(/^the background color should be solid light grey$/) do
  page.find('body').native.css_value('background-color').should == "rgba(211, 211, 211, 1)"
end

Then(/^the input box outline color should be dark grey$/) do
  page.find_by_id('inputBox').native.css_value('border').should == "3px solid rgb(128, 128, 128)"
end

Then(/^the input box should be centered on the page$/) do
  page.find('form').native.css_value('text-align').should == "center"
end

Then(/^the prompt text should be Enter topic$/) do
  page.find_by_id('inputBox')['placeholder'].should == "Enter topic"
end

Then(/^the prompt text color should be light grey$/) do
  find(:css, 'placeholder').native.css_value('color').should == "BEBBBB"
end

Then(/^the input box background color is white$/) do
  page.find_by_id('inputBox').native.css_value('background-color').should == "rgba(255, 255, 255, 1)"
end

Then(/^the button text should read "([^"]*)"$/) do |arg1|
  page.find_by_id('buildCollageButton')['value'].should have_content arg1
end

Then(/^the button text is white$/) do
  page.find_by_id('buildCollageButton').native.css_value('color').should == "rgba(255, 255, 255, 1)"
end

Then(/^the button color is dark gray$/) do
  page.find_by_id('buildCollageButton').native.css_value('background-color').should == "rgba(128, 128, 128, 1)"
end

When(/^the input box has no text$/) do 
  fill_in('inputBox', :with => "")
end

Then(/^the button cannot be pressed$/) do
  find_by_id('inputBox')['required']
end

When(/^user starts typing into the input box$/) do
  fill_in('inputBox', :with => "text")
end

Then(/^the placeholder text should disappear$/) do
 find_field('inputBox', :with => "text") 
end

When(/^the user presses enter the build collage button is pressed$/) do
  page.should have_selector('input[type=submit]')
end

When(/^the build collage button is pressed$/) do
  find_by_id('buildCollageButton').click
end

Then(/^the page should be "([^"]*)"$/) do |arg1|
  visit arg1
end

Then(/^the topic title should be "([^"]*)"$/) do |arg1|
  page.find_by_id('p1', text: "Collage for topic text")
end
























