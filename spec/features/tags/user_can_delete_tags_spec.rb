require "rails_helper"

describe "user sees all tags" do
  it "shown on tags index page" do
    article1 = Article.create!(title: "Turing", body: "Mod 2 is the best!")
    tag1 = article1.tags.create(name: "Ruby")


    visit '/tags'
    expect(page).to have_content("Ruby")

    click_on("Delete This Tag")
    expect(page).to_not have_content("Ruby")
  end
end
