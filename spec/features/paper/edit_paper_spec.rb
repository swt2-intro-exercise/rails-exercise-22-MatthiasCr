require 'rails_helper'

 describe "Edit Paper page", type: :feature do
    it "should render without error" do
      @cmi = FactoryBot.create :paper
      visit edit_paper_path(@cmi)
    end
 end