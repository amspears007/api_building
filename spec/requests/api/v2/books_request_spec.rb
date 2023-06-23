require "rails_helper"

describe "Books API" do
  it "sends a list of books" do
    create_list(:book, 3)

    # require 'pry'; binding.pry
    get "/api/v2/books"

    expect(response).to be_successful
    books = JSON.parse(response.body, symbolize_names: true)
    expect(books.count).to eq(3)
    books.each do |book|
      expect(book).to have_key(:id)
      
    end
  end
end