require 'rest-client'
require 'test-unit'

Then (/^I create new project$/) do
  create_new_project
end

Then (/^I create new environments$/) do
  create_dev_environment
  create_prod_environment
end

Then (/^I delete created environments$/) do
  delete_environments_dev
  delete_environments_prod
end