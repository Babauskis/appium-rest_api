require 'rest-client'
require 'test-unit'

Then (/^I choose existing project$/) do
  choose_existing_project
end

Then (/^I create TESTAPI request collection$/) do
  create_request_collection
end