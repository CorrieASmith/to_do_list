require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe("/", {:type => :feature}) do
  it("Correctly opens index page") do
    visit('/')
    expect(page).to have_content("To Do List")
  end

  before() do
    Task.clear()
  end

  it("Takes user input and adds task to To Do List") do
    visit('/')
    fill_in('description', :with => "Go To School")
    click_button("Add")
    expect(page).to have_content("Go To School")
  end

  it("Deletes a task from the to do list") do
    visit('/')
    fill_in('description', :with => "Go To School")
    click_button('Add')
    click_link('delete')
    expect(page).to have_no_content("Go To School")
  end

  it("Marks a task complete") do
    visit('/')
    fill_in('description', :with => "Go To School")
    click_button('Add')
    click_link('done')
    expect(page).to have_css('.ck-done')
  end
end
