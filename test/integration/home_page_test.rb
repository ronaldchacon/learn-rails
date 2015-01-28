# feature: home_page
#   as a visitor
#   i want to visit a home page
#   so i can learn more about the website
feature "Home page" do
  # scenario: visit the home page
  #   given: i am a visitor
  #   when: i visit the home page
  #   then: i see "welcome"
  scenario "visit the home page" do
    visit root_path
    page.must_have_content "Stay in touch"
  end
end