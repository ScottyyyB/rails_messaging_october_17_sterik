When("I visit the landing page") do
  visit root_path
end

Then("I should see a title {string}") do |content|
  expect(page).to have_content content
end

And("I should see a link {string}") do |link|
  expect(page).to have_link link
end
