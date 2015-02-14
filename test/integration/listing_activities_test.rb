require 'test_helper'

class ListingActivitiesTest < ActionDispatch::IntegrationTest

  setup { host! 'api.cs-activities-dev.com'}

  # test 'returns list of all activities' do
  #   get '/activities'
  #   assert_equal 200, response.status
  #   refute_empty response.body
  # end

  # test 'returns activities filtered by category' do
  #   sport_activity = Activity.create!(name: 'Kalmar Tennisklubb', description: 'Bra tennisklubb', indoors: true, category_id: 1)
  #   relax_activity = Activity.create!(name: 'Halltorps gästgiveri', description: 'Utmärkt för avslappning', indoors: true, category_id: 2)
  #
  #   # I can see something is wrong already, I would prefer '/activities/?category=sports'
  #   get '/activities/?category_id=1'
  #   assert_equal 200, response.status
  #
  #   # json is a helper method
  #   activities = json(response.body)
  #   category_ids = activities.collect { |a| a[:category_id] }
  #   assert_includes category_ids, 1
  #   refute_includes category_ids, 2
  #
  # end

  test 'returns activity by id' do
    activity = Activity.create!(name: 'Kalmar Tennisklubb', description: 'Bra tennisklubb', indoors: true, category_id: 1)

    # Routes to Avtivities#show
    get "/activities/#{activity.id}"
    assert_equal 200, response.status

    activity_response = json(response.body)
    assert_equal activity.name, activity_response[:name]
  end

  test 'returns activities in JSON' do
    get '/activities', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns activities in XML' do
    get '/activities', {}, { 'Accept' => Mime::XML }
    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
  end

end
