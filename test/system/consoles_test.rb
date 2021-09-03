require "application_system_test_case"

class ConsolesTest < ApplicationSystemTestCase
  setup do
    @console = consoles(:one)
  end

  test "visiting the index" do
    visit consoles_url
    assert_selector "h1", text: "Consoles"
  end

  test "creating a Console" do
    visit consoles_url
    click_on "New Console"

    fill_in "Acronym", with: @console.acronym
    fill_in "Description", with: @console.description
    fill_in "Url image", with: @console.url_image
    click_on "Create Console"

    assert_text "Console was successfully created"
    click_on "Back"
  end

  test "updating a Console" do
    visit consoles_url
    click_on "Edit", match: :first

    fill_in "Acronym", with: @console.acronym
    fill_in "Description", with: @console.description
    fill_in "Url image", with: @console.url_image
    click_on "Update Console"

    assert_text "Console was successfully updated"
    click_on "Back"
  end

  test "destroying a Console" do
    visit consoles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Console was successfully destroyed"
  end
end
