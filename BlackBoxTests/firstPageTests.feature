Feature: Testing the first page

Background:

	Given I am on "http://localhost:8080/CSCI310Servlet1.0/firstPage.jsp"


Scenario: First page formatting

	Then the background color should be solid light grey

	Then the input box outline color should be dark grey

	And the input box should be centered on the page

	And the prompt text should be Enter topic

	And the input box background color is white

	And the button text should read "Build Collage"
	
	And the button text is white

	And the button color is dark gray


Scenario: First page functionality

	When user starts typing into the input box
	
	Then the placeholder text should disappear

	When the user presses enter the build collage button is pressed

	When the input box has no text

	Then the button cannot be pressed

	When the build collage button is pressed 

	Then the page should be "http://localhost:8080/CSCI310Servlet1.0/driver?buildCollage=text"

	And the topic title should be "Collage for topic text"


	




