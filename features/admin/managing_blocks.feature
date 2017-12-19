@managing_blocks
Feature: Managing cms blocks
    In order to present dynamic content in my store
    As an Administrator
    I want to be able to manage existing blocks

    Background:
        Given the store operates on a single channel in "United States"
        And I am logged in as an administrator

    @ui
    Scenario: Deleting block
        Given there is a block in the store
        When I go to the blocks page
        And I delete this block
        Then I should be notified that the block has been deleted
        And I should see empty list of blocks

    @ui
    Scenario: Updating text block
        Given there is a text block with "store_phone_number" code and "123456789" content
        When I go to the update "store_phone_number" block page
        And I fill the content with "987654321"
        And I update it
        Then I should be notified that the block has been successfully updated

    @ui
    Scenario: Updating html block
        Given there is a html block with "store_email" code and "<a href='mailto:mikolaj.krol@bitbag.pl'>mikolaj.krol@bitbag.pl</a>" content
        When I go to the update "store_email" block page
        And I fill the content with "<a href='mailto:mikolaj.krol@bitbag.pl'>mikolaj.krol@bitbag.pl</a>"
        And I update it
        Then I should be notified that the block has been successfully updated

    @ui
    Scenario: Updating image block
        Given there is an existing block with "porsche_911_singer" code and "porsche_911_singer_1.jpg" image
        When I go to the update "porsche_911_singer" block page
        And I upload the "porsche_911_singer_2.jpg" image
        And I update it
        Then I should be notified that the block has been successfully updated

    @ui
    Scenario: Disabling block
        Given there is an existing block with "bitbag_quote" code
        When I go to the update "bitbag_quote" block page
        And I disable it
        And I update it
        Then I should be notified that the block has been successfully updated
        And this block should be disabled

    @ui
    Scenario: Seeing disabled code field while editing a block
        Given there is a block in the store
        When I want to edit this block
        Then the code field should be disabled

    @ui
    Scenario: Being able to chose which block type to create
        When I go to the blocks page
        Then I should be able to select between "Text block", "HTML block" and "Image block" block types under Create button