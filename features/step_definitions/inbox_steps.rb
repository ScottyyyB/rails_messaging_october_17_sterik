Given("the following user exists") do |table|
  table.hashes.each do |user|
    User.create(user)
  end
end

Given("I am signed in as {string}") do |name|
   @user = User.find_by(name: name)
   login_as(@user, scope: :user)
end

When("I visit the {string} page") do |page_name|
  visit page_path_from(page_name)
end

Then("I should see the {string} button") do |link|
  expect(page).to have_link link
end

Given("I send a mail to {string}") do |name|
  @receiver = User.find_by(name: name)
  @user.send_message(@receiver, 'Hey there', 'Subject')
end

Then("I should have {string} message") do |expected_count|
  count = @receiver.mailbox.inbox.count
  expect(count).to eq expected_count.to_i
end

def page_path_from(page_name)
  case page_name.downcase
    when 'inbox' then '/mailbox/inbox'
  end
end
