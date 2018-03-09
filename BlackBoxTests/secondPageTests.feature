Feature: Second page tests

Background:

	Given I am on the page "http://localhost:8080/CSCI310Servlet1.0/driver?buildCollage=text"

Scenario: Second page formatting

	Then the background color should be white

	And the title text should be black
	
	And the title text reads "Collage for topic text"

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

	And the Collage width is not less than 800 pixels

	And the Collage height is not less than 600 pixels

	And the Collage is centered in the page ""
