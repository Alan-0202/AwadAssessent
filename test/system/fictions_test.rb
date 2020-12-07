require "application_system_test_case"

class FictionsTest < ApplicationSystemTestCase
  setup do
    @fiction = fictions(:one)
  end

  test "visiting the index" do
    visit fictions_url
    assert_selector "h1", text: "Fictions"
  end

  test "creating a Fiction" do
    visit fictions_url
    click_on "New Fiction"

    fill_in "Author", with: @fiction.author
    fill_in "Name", with: @fiction.name
    fill_in "Price", with: @fiction.price
    fill_in "Reviews", with: @fiction.reviews
    fill_in "Year", with: @fiction.year
    click_on "Create Fiction"

    assert_text "Fiction was successfully created"
    click_on "Back"
  end

  test "updating a Fiction" do
    visit fictions_url
    click_on "Edit", match: :first

    fill_in "Author", with: @fiction.author
    fill_in "Name", with: @fiction.name
    fill_in "Price", with: @fiction.price
    fill_in "Reviews", with: @fiction.reviews
    fill_in "Year", with: @fiction.year
    click_on "Update Fiction"

    assert_text "Fiction was successfully updated"
    click_on "Back"
  end

  test "destroying a Fiction" do
    visit fictions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fiction was successfully destroyed"
  end
end
