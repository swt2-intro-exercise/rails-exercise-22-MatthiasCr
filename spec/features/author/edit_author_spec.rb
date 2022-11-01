require 'rails_helper'

 describe "Edit Author page", type: :feature do
    it "should render without error" do
      @alan = FactoryBot.create :author
      visit edit_author_path(@alan)
    end

    it "should save the edited author in db" do
        # Given
        @alan = FactoryBot.create(:author)
        new_last_name = "TuringDerCoole"
    
        # When
        visit edit_author_path(@alan)
        page.fill_in('author[last_name]', with: new_last_name)
        find('input[type="submit"]').click
    
        # Then
        expect(Author.last.last_name).to eq(new_last_name)
    end

    it "should show validation error messages" do
        # Given
        @alan = FactoryBot.create(:author)
    
        # When
        visit edit_author_path(@alan)
        page.fill_in('author[last_name]', with: "T")
        find('input[type="submit"]').click
    
        # Then
        expect(page).to have_text("error")
    end
 end

      