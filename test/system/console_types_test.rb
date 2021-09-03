require "application_system_test_case"

class ConsoleTypesTest < ApplicationSystemTestCase
  setup do
    @console_type = console_types(:one)
  end

  test "visiting the index" do
    visit console_types_url
    assert_selector "h1", text: "Console Types"
  end

  test "creating a Console type" do
    visit console_types_url
    click_on "New Console Type"

    fill_in "Acronym", with: @console_type.acronym
    fill_in "Description", with: @console_type.description
    click_on "Create Console type"

    assert_text "Console type was successfully created"
    click_on "Back"
  end

  test "updating a Console type" do
    visit console_types_url
    click_on "Edit", match: :first

    fill_in "Acronym", with: @console_type.acronym
    fill_in "Description", with: @console_type.description
    click_on "Update Console type"

    assert_text "Console type was successfully updated"
    click_on "Back"
  end

  test "destroying a Console type" do
    visit console_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Console type was successfully destroyed"
  end
end
