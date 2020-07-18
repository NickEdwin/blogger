require "rails_helper"

describe "user edits an article" do
  describe "they link from the show page" do
    it "displays a form to edit the entry" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit article_path(article_1)
      click_link "Edit"

      expect(current_path).to eq(edit_article_path(article_1))



      fill_in "article[title]", with: "Updated Title!"
      fill_in "article[body]",  with: "Updated Body!"
      click_on "Update Article"

      expect(page).to have_content("Article 'Updated Title!' Updated!")
      expect(page).to have_content("Updated Title!")
      expect(page).to have_content("Updated Body!")
    end
  end
end
