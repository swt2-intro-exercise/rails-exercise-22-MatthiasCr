require 'rails_helper'

 describe "Index Paper page", type: :feature do
    it "should render without error" do
      @cmi = FactoryBot.create :paper
      visit papers_path(@cmi)
    end

    it "shows all papers" do
      # Given
      @paper = create(:paper, title: "coolesPaper")
      @another_paper = create(:paper, title: "tollesPaper")

      # When
      visit papers_path
      
      # Then
      expect(page).to have_text("tollesPaper")
      expect(page).to have_text("coolesPaper")
    end

    it "can be filtered by year" do
      # Given
      @paper = create(:paper, title: "coolesPaper", year: 9999)
      @paper_other_year = create(:paper, title: "tollesPaper", year: 1234)

      # Then
      visit "/papers?year=1234"
      expect(page).to have_text("tollesPaper")
      expect(page).to_not have_text("coolesPaper")

      # Then
      visit "/papers?year=9999"
      expect(page).to_not have_text("tollesPaper")
      expect(page).to have_text("coolesPaper")

      # Then
      visit "/papers?year=5555"
      expect(page).to_not have_text("tollesPaper")
      expect(page).to_not have_text("coolesPaper")
    end
 end