require 'rails_helper'

 RSpec.describe Paper, type: :model do

  it "should not validate without title" do
    # Given
    venue = "Mind 49: 433-460"
    year = 1950
    paper = Paper.new(:venue => venue, :year => year)

    # Then
    expect(paper).to_not be_valid
  end

  it "should not validate without venue" do
    # Given
    title = "COMPUTING MACHINERY AND INTELLIGENCE"
    year = 1950
    paper = Paper.new(:title => title, :year => year)

    # Then
    expect(paper).to_not be_valid
  end

  it "should not validate without year" do
    # Given
    title = "COMPUTING MACHINERY AND INTELLIGENCE"
    venue = "Mind 49: 433-460"
    paper = Paper.new(:title => title, :venue => venue)

    # Then
    expect(paper).to_not be_valid
  end

  it "should not validate with a not numeric year value" do
    # Given
    title = "COMPUTING MACHINERY AND INTELLIGENCE"
    venue = "Mind 49: 433-460"
    year  = "lololol"
    paper = Paper.new(:title => title, :venue => venue, :year => year)

    # Then
    expect(paper).to_not be_valid
  end

  it "has an authors list" do
    paper = Paper.create
    expect(paper.authors.length).to eq 0
  end
 end
