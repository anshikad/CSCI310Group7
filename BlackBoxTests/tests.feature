Feature: Tests

Background:

	Given I am on "http://localhost:8080/CSCI310Servlet1.0/firstPage.jsp"

Scenario: First page formatting

	Then the button text should read "Build Collage"
	
	And the button text is white

	And the button color is dark gray

	And the button is to the right of the input box

Scenario: First page functionality

	When the input box has no text

	Then the button cannot be pressed

Scenario: Second page formatting

	Given I am on "http://localhost:8080/CSCI310Servlet1.0/driver?buildCollage=hello"

	Then the background color should be white

	And the title text should be black
	
	And the title text reads "Collage for topic hello"

	And the title text font size is at least 24 pt

	And the Build Another Collage button color is dark gray

	And the BAC text is white

	And the BAC button text reads "Build Another Collage"

	And the Input Box has a dark gray outline

	And the Input Box prompt reads "Enter topic"

	And the Input Box background color is white

	And the Export Collage button is dark gray

	And the Export Collage button text color is white

	And the Export Collage button label reads "Export Collage"

Scenario: Second page functionality
	
	Given I am on "http://localhost:8080/CSCI310Servlet1.0/driver?buildCollage=hello"
	
	When the user starts typing in the Input Box

	Then the prompt text disappears

	When the user presses enter
	
	Then the Build Collage process is triggered

	
	
