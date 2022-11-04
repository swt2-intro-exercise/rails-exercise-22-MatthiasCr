require 'rails_helper'

 describe "Paper page", type: :feature do
    it "should render without error" do
      @cmi = FactoryBot.create :paper
      visit paper_path(@cmi)
    end

    it "should display the authors full names" do
      # Given
      @paper = FactoryBot.create :paper
      @author = FactoryBot.create :author
      @paper.authors << @author

      # When
      visit paper_path(@paper)

      # Then
      expect(page).to have_text(@author.name)
    end
 end