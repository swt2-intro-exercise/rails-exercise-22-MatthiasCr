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
    first_name = 'Alan'
    last_name = 'Turing'
    homepage = 'http://wikipedia.org/Alan_Turing'
    author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)

    # When
    visit new_author_path
    page.fill_in('author[first_name]', with: first_name)
    page.fill_in('author[last_name]', with: last_name)
    page.fill_in('author[homepage]', with: homepage)
    find('input[type="submit"]').click

    # Then
    expect(Author.last).to eq(author)
   end

   it "should show validation error messages" do
    # Given
    first_name = 'Alan'
    last_name = 'T'
    author = Author.new(:first_name => first_name, :last_name => last_name)

    # When
    visit new_author_path
    page.fill_in('author[first_name]', with: first_name)
    page.fill_in('author[last_name]', with: last_name)
    find('input[type="submit"]').click

    # Then
    expect(page).to have_text("error")
   end
 end
