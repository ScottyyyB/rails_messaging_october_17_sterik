Given("I am on the landing page") do
  visit root_path
end

When("I press the {string} button") do |sign_up|
  click_link_or_button sign_up
end

Then("I should be redirected to the {string} page") do |sign_up_page|
  visit "#{sign_up_page}"
end

Given("I am on the {string} page") do |sign_up_page|
  visit "/#{sign_up_page}"
end

Then("I should see {string}") do |text|
  expect(page).to have_content text
end
