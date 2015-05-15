Given(/^I am on the home page$/) do
  visit "/"
end

Then(/^I should be on the home page$/) do
  assert current_path, "/"
end