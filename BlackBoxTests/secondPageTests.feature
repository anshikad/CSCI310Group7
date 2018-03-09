Feature: Second page tests

Background:

	Given I am on the page "http://localhost:8080/CSCI310Servlet1.0/driver?buildCollage=text"

Scenario: Second page formatting

	Then the background color should be white

	And the title text should be black
	
	And the title text reads "Collage for topic text"

	And the title text font size is at least 24 pt

	And the Build Another Collage button color is dark gray

	And the Build Another Collage text is white

	And the Build Another Collage button text reads "Build Another Collage"

	And the Input Box has a dark gray outline

	And the Input Box prompt reads "Enter topic"

	And the Input Box background color is white

	And the Export Collage Button color is dark gray

	And the Export Collage Button text color is white

	And the Export Collage Button Label text is "Export Collage"

	And the Collage width is not less than 800 pixels

	And the Collage height is not less than 600 pixels

	And the Collage is centered in the page ""

Scenario: Second page functionality

	When the user enters more text

	When the Build Another Collage button is pressed

	And the topic title should be Collage for topic blah

	When the user presses enter the Build Another Collage button is pressed

	Then the previous collages size should be scaled down to width "100px" 

	And the previous collages size should be scaled down to height "100px"

	Then the the previous collages are arranged in a horizontal row

	And the previous collage picker has a scroll bar with overflow

	
