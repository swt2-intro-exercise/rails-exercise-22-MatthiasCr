require 'rails_helper'

describe "Author", type: :model do
  it "should have a first name, last name and a homepage" do
    # Given
    first_name = "Alan"
    last_name = "Turing"
    homepage = "http://wikipedia.org/Alan_Turing"

    # When
    author = Author.new(:first_name => first_name, :last_name => last_name, :homepage => homepage)

    # Then
    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
  end

  it "should concatinate first name and last name to full name" do
    # Given
    first_name = "Alan"
    last_name = "Turing"
    full_name = "Alan Turing"

    # When
    author = Author.new(:first_name => first_name, :last_name => last_name)

    # Then
    expect(author.name).to eq(full_name)
  end

  it "should not validate without last name" do
    # Given
    first_name = "Alan"
    homepage = "http://wikipedia.org/Alan_Turing"
    author = Author.new(:first_name => first_name, :homepage => homepage)

    # Then
    expect(author).to_not be_valid
  end
end