require 'test_helper'

class ScrapersControllerTest < ActionController::TestCase
  setup do
    @scraper = scrapers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrapers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scraper" do
    assert_difference('Scraper.count') do
      post :create, scraper: { certifications: @scraper.certifications, education: @scraper.education, first_name: @scraper.first_name, groups: @scraper.groups, industry: @scraper.industry, languages: @scraper.languages, last_name: @scraper.last_name, location: @scraper.location, name: @scraper.name, organizations: @scraper.organizations, picture: @scraper.picture, skills: @scraper.skills, title: @scraper.title, websites: @scraper.websites }
    end

    assert_redirected_to scraper_path(assigns(:scraper))
  end

  test "should show scraper" do
    get :show, id: @scraper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scraper
    assert_response :success
  end

  test "should update scraper" do
    patch :update, id: @scraper, scraper: { certifications: @scraper.certifications, education: @scraper.education, first_name: @scraper.first_name, groups: @scraper.groups, industry: @scraper.industry, languages: @scraper.languages, last_name: @scraper.last_name, location: @scraper.location, name: @scraper.name, organizations: @scraper.organizations, picture: @scraper.picture, skills: @scraper.skills, title: @scraper.title, websites: @scraper.websites }
    assert_redirected_to scraper_path(assigns(:scraper))
  end

  test "should destroy scraper" do
    assert_difference('Scraper.count', -1) do
      delete :destroy, id: @scraper
    end

    assert_redirected_to scrapers_path
  end
end
