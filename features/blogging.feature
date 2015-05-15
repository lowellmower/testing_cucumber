Feature: Blogging
  In order to monetize content
  As a site operator
  I want people to be able to create a blog post

  Scenario: Creating a blog post
    Given I am on the home page
    And I follow "New Post"
    When I fill in "Title" with "Hello World!"
    And I fill in "Body" with "This is my first post!"
    And I press "Publish"
    Then I should see "Hello World!"
    And I should see "This is my first post!"

  Scenario: Creating an invalid blog
    Given I am on the home page
    And I follow "New Post"
    When I fill in "Title" with ""
    And I fill in "Body" with "This is my first post"
    And I press "Publish"
    Then I should see "can't be blank"
    When I fill in "Title" with "Hello World!"
    And I fill in "Body" with ""
    And I press "Publish"
    Then I should see "can't be blank"
    And I fill in "Body" with "This is my first post"
    And I press "Publish"
    Then I should see "Hello World!"
    And I should see "This is my first post"

  Scenario: Listing Articles
    Given I have the following posts:
      |title|body|
      |My First Post|This is my first post|
      |My Second Post|This is my second post|
    When I am on the home page
    Then "My Second Post" should be listed first
    And "My First Post" should be listed second
    When I follow "My Second Post"
    Then I should see "My Second Post"
    And I should see "This is my second post"
    When I follow "Home"
    Then I should be on the home page