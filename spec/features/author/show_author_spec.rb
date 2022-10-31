require 'rails_helper'

 describe "Author page", type: :feature do
    it "should display the details of an author" do
      # Given
      @alan = FactoryBot.create :author

      # When
      visit author_path(@alan)

      # Then
      expect(page).to have_text("Alan Turing")

    end
 end