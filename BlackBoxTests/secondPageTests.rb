Given(/^I am on the page "([^"]*)"$/) do |arg1|
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

Then(/^the Build Another Collage text is white$/) do
  page.find_by_id('buildCollageBtn').native.css_value('color').should == "rgba(255, 255, 255, 1)"
end

Then(/^the Build Another Collage button text reads "([^"]*)"$/) do |arg1|
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

Then(/^the Export Collage Button color is dark gray$/) do
  page.find_by_id('exportCollageButton').native.css_value('background-color').should == "rgba(128, 128, 128, 1)"
end

Then(/^the Export Collage Button text color is white$/) do
  page.find_by_id('exportCollageButton').native.css_value('color').should == "rgba(255, 255, 255, 1)"
end

Then(/^the Export Collage Button Label text is "([^"]*)"$/) do |arg1|
  page.find_by_id('exportCollageButton')['value'].should have_content arg1
end

Then(/^the Collage is centered in the page "([^"]*)"$/) do |arg1|
  page.find_by_id('exportCollage').native.css_value('align').should == arg1
end

Then(/^the Collage width is not less than (\d+) pixels$/) do |arg1|
  page.find_by_id('exportCollage')['width'].should <= arg1
end

Then(/^the Collage height is not less than (\d+) pixels$/) do |arg1|
  page.find_by_id('exportCollage')['height'].should <= arg1
end

When(/^the user enters more text$/) do 
  fill_in('topicBox', :with => "blah")
end

When(/^the Build Another Collage button is pressed$/) do
  page.find_by_id('buildCollageBtn').click
end

Then(/^the topic title should be Collage for topic blah$/) do 
  page.find_by_id('p1', text: "Collage for topic blah")
end

When(/^the user presses enter the Build Another Collage button is pressed$/) do
  page.should have_selector('input[type=submit]')
end

Then(/^the previous collages size should be scaled down to width "([^"]*)"$/) do |arg1|
  page.find_by_id('0').native.css_value('width').should == arg1
end 

Then(/^the previous collages size should be scaled down to height "([^"]*)"$/) do |arg1|
  page.find_by_id('0').native.css_value('height').should == arg1
end 

Then(/^the the previous collages are arranged in a horizontal row$/) do
  page.find('div.scrollmenu')
end

Then (/^the previous collage picker has a scroll bar with overflow$/) do 
  page.find('div.scrollmenu')['overflow']
end
