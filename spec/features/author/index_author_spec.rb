require 'rails_helper'

 describe "Author index page", type: :feature do
    it "should render without errors" do
      visit authors_path
    end

    it "should display a table with all authors full names and homepages" do
      # Given
      @author1 = FactoryBot.create(:author)
      @author2 = FactoryBot.create(:author, first_name: "John", last_name: "Doe", homepage: "xD")
      
      # When
      visit authors_path
      
      # Then
      expect(page).to have_text("Alan Turing")
      expect(page).to have_text("http://wikipedia.de/Alan_Turing")
      expect(page).to have_text("John Doe")
      expect(page).to have_text("xD")
    end

    it "authour names should link to their page" do
      # Given
      @author = FactoryBot.create(:author)
      
      # When
      visit authors_path
      
      # Then
      expect(page).to have_link 'Alan Turing', href: author_path(@author)
    end

    it "a link to new_author_path should exist" do
      visit authors_path
      expect(page).to have_link 'New', href: new_author_path
    end
 end