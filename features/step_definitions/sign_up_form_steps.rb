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
