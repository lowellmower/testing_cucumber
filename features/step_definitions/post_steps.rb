Given(/^I have the following posts:$/) do |table|
  for hash in table.hashes
    Post.create(hash)
  end
end

Then(/^"(.*?)" should be listed (.*)$/) do |title, position|
  all("h1").each_with_index do |h1, i|
    if position == "first" && i == 0
      assert_equal h1.text, title
    elsif position == "second" && i == 1
      assert_equal h1.text, title
    end
  end
end

Then(/^I should be on the "(.*?)" post page$/) do |title|
  post = Post.where(:title => title).first
  assert_equal current_path, post_path(post)
end
