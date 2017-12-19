@shop_blocks
Feature: Displaying blocks
    In order to buy more items in the store
    As a Customer
    I want to display content blocks on the homepage

    Background:
        Given the store operates on a single channel in "United States"

    @ui
    Scenario: Displaying homepage blocks
        Given there is a text block with "homepage_intro" code and "Hello world!" content
        And there is an existing block with "homepage_header_image" code and "homepage_main.jpeg" image
        When I go to the homepage
        Then I want to see an image block
        And I want to see a text block with "Hello world!" content
