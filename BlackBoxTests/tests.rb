Given(/^I am on "([^"]*)"$/) do |arg1|
  visit arg1
end

Then(/^the background color should be white$/) do
  page.find('body').native.css_value('background-color').should == "rgba(0, 0, 0, 0)"
end

Then(/^the title text should be black$/) do
  page.find_by_id('p1').native.css_value('color').should == "rgba(0, 0, 0, 1)"
end

Then(/^the title text reads "([^"]*)"$/) do |arg1|
  page.find_by_id('p1').should have_content arg1
end

Then(/^the title text font size is at least (\d+) pt$/) do |arg1|
  page.find_by_id('p1').native.css_value('font-size').should == "24px"
end

Then(/^the Build Another Collage button color is dark gray$/) do
  page.find_by_id('buildCollageBtn').native.css_value('background-color').should == "rgba(128, 128, 128, 1)"
end

Then(/^the BAC text is white$/) do
  page.find_by_id('buildCollageBtn').native.css_value('color').should == "rgba(255, 255, 255, 1)"
end

Then(/^the BAC button text reads "([^"]*)"$/) do |arg1|
  page.find_by_id('buildCollageBtn')['value'].should have_content arg1
end

Then(/^the Input Box has a dark gray outline$/) do
  page.find_by_id('topicBox').native.css_value('border').should == "3px solid rgb(128, 128, 128)"
end

Then(/^the Input Box prompt reads "([^"]*)"$/) do |arg1|
  page.find_by_id('topicBox')['placeholder'].should == arg1
end

Then(/^the Input Box background color is white$/) do
  page.find_by_id('topicBox').native.css_value('background-color').should == "rgba(255, 255, 255, 1)"
end

Then(/^the Export Collage button is dark gray$/) do
  page.find_by_id('exportCollageButton').native.css_value('background-color').should == "rgba(128, 128, 128, 1)"
end

Then(/^the Export Collage button text color is white$/) do
  page.find_by_id('exportCollageButton').native.css_value('color').should == "rgba(255, 255, 255, 1)"
end

Then(/^the Export Collage button label reads "([^"]*)"$/) do |arg1|
  page.find_by_id('exportCollageButton')['value'].should have_content arg1
end

When(/^the user starts typing in the Input Box$/) do
  fill_in('topicBox', :with => "some text")
end

Then(/^the prompt text disappears$/) do
  find_field('topicBox', :with => "some text")
end

When(/^the user presses enter$/) do
  page.should have_selector('input[type=submit]')
end

Then(/^the Build Collage process is triggered$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the button text should read "([^"]*)"$/) do |arg1|
  page.find_by_id('buildButton')['value'].should have_content arg1
end

Then(/^the button text is white$/) do
  page.find_by_id('buildButton').native.css_value('color').should == "rgba(255, 255, 255, 1)"
end

Then(/^the button color is dark gray$/) do
  page.find_by_id('buildButton').native.css_value('background-color').should == "rgba(128, 128, 128, 1)"
end

Then(/^the button is to the right of the input box$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the input box has no text$/) do
  fill_in('inputBox', :with => "")
end

Then(/^the button cannot be pressed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


