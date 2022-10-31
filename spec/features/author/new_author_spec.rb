require 'rails_helper'

 describe "New author page", type: :feature do
   it "should exist at 'new_author_path' and render without error" do
     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     visit new_author_path
   end

   it "should have text input fields for an author's first name, last name and homepage" do
     visit new_author_path

     expect(page).to have_field('author[first_name]')
     expect(page).to have_field('author[last_name]')
     expect(page).to have_field('author[homepage]')
   end

   it "should save a new author in the database on submit" do
    # Given
    last_name = 'Turing'
    author = Author.new(:last_name => last_name)

    # When
    visit new_author_path
    page.fill_in('author[last_name]', with: last_name)
    find('input[type="submit"]').click

    # Then
    expect(Author.last).to eq(author)
   end
 end
