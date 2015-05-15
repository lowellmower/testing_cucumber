Feature: Commenting
  In order to increase engagement on the site to monetize traffic
  As an site operator
  I want people to be able to comment on blog posts

Background:
  Given I have the following posts:
    |title|body|
    |My First Post|This is my first post|
    |My Second Post|This is my second post|
  And I am on the home page
  And I follow "My Second Post"

Scenario: Creating a comment
  When I fill in "Name" with "Andrew"
  And I fill in "Body" with "My Awesome comment"
  And I press "Submit Comment"
  Then I should be on the "My Second Post" post page
  And I should see "Comment by: Andrew"
  And I should see "My Awesome comment"
  When I follow "Home"
  And I follow "My First Post"
  Then I should not see "Comment by: Andrew"
  And I should not see "My Awesome comment"
@wip
Scenario: Creating an invalid comment
  When I fill in "Name" with ""
  And I fill in "Body" with "My Awesome comment"
  And I press "Submit Comment"
  Then I should see "can't be blank"
  When I fill in "Name" with "Andrew"
  And I fill in "Body" with ""
  And I press "Submit Comment"
  Then I should see "can't be blank"
  When I fill in "Body" with "My Awesome comment"
  And I press "Submit Comment"
  And I should see "Comment by: Andrew"
  And I should see "My Awesome comment"