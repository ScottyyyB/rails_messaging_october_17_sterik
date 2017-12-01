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

When("I press the {string} button") do |sign_up|
  click_link sign_up
end

Then("I should be (redirected to)/on the {string} page") do |page_name|
  expect(page.current_path).to eq page_path_from(page_name)
end

Given("I visit the {string} page") do |page_name|
  visit page_path_from(page_name)
end

Then("I should see {string}") do |text|
  expect(page).to have_content text
end

def page_path_from(page_name)
  case page_name.downcase
  when 'sign up' then '/users/sign_up'
  when 'landing' then root_path
  when 'new conversation' then 'conversations/new'
  else
    raise "Sorry but we don't know this page. Add it to the page_path_from"\
          ' in features/step_definitions/sign_up_steps.rb'
  end
end
