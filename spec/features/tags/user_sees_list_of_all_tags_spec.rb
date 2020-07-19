require "rails_helper"

describe "user sees all tags" do
  it "shown on tags index page" do
    article1 = Article.create!(title: "Turing", body: "Mod 2 is the best!")
    article2 = Article.create!(title: "Life", body: "Something deep and philosophical")
    tag1 = article1.tags.create(name: "Ruby")
    tag2 = article1.tags.create(name: "Tech")
    tag3 = article2.tags.create(name: "Life")
    tag4 = article2.tags.create(name: "Ruby")

    visit '/tags'

    expect(page).to have_content("Ruby")
    expect(page).to have_content("Tech")
    expect(page).to have_content("Life")
  end
end
