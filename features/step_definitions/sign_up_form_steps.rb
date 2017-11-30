Given("the following user exists") do |table|
  table.hashes.each do |user|
    User.create(user)
  end
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I click button {string}") do |element|
  click_button element
end

Then("I should be on the {string} page") do |conversation_page|
  visit "/#{conversation_page}"
end
