Given("I am on the {string} page") do |sign_up_page|
  visit "/#{sign_up_page}"
end

Then("I should see {string}") do |text|
  expect(page).to have_content text
end
