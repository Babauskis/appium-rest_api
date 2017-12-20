def create_new_project
  @test_project = Project.new( '','', 'basic')
  project_payload = {:name => @test_project.name,
                     :type => @test_project.type}.to_json

  response = post("http://www.apimation.com/projects",
                  headers: {'Content-Type' => 'application/json'},
                  cookies: @test_user.session_cookie,
                  payload: project_payload)


  puts response.cookies
  #Check if 200 OK is received
  assert_equal(200, response.code, "Wrong error code received! Response: #{response}")
  response_hash = JSON.parse(response)

  assert_equal(@test_project.name, response_hash['name'], 'Project exists!')
  assert_not_equal(nil, response_hash['id'], 'Project id is empty!')


  assert_equal(@test_project.type, response_hash['type'], 'Project type is not basic!')

  @test_project.set_project_id(response_hash['id'])
  puts @test_project.id
  puts @test_project.name
end

def create_dev_environment
  @test_environment_DEV = Project.new( '','', '')
  project_payload = {:name => @test_environment_DEV.name}.to_json
  response = post("http://www.apimation.com/environments",
                  headers: {'Content-Type' => 'application/json'},
                  cookies: @test_user.session_cookie,
                  payload: project_payload)


  puts response.cookies
  #Check if 200 OK is received
  assert_equal(200, response.code, "Wrong error code receivy! Response: #{response}")
  response_hash = JSON.parse(response)

  assert_equal(@test_environment_DEV.name, response_hash['name'], 'Environment exists!')
  assert_not_equal(nil, response_hash['id'], 'Project id is empty!')

  @test_environment_DEV.set_project_id(response_hash['id'])
  puts @test_environment_DEV.id
  puts @test_environment_DEV.name

end

def create_prod_environment
  @test_environment_PROD = Project.new('','','')
  project_payload = {:name => @test_environment_PROD.name}.to_json
  response = post("http://www.apimation.com/environments",
                  headers: {'Content-Type' => 'application/json'},
                  cookies: @test_user.session_cookie,
                payload: project_payload)


  puts response.cookies
  #Check if 200 OK is received
  assert_equal(200, response.code, "Wrong error code receivy! Response: #{response}")
  response_hash = JSON.parse(response)

  assert_equal(@test_environment_PROD.name, response_hash['name'], 'Environment already exists!')

  assert_not_equal(nil, response_hash['id'], 'Project id is empty!')

  @test_environment_PROD.set_project_id(response_hash['id'])
  puts @test_environment_DEV.id
  puts @test_environment_PROD.name
end

def delete_environments_dev

  response = delete("http://www.apimation.com/environments/"+@test_environment_DEV.id,
                  headers: {},
                  cookies: @test_user.session_cookie)


  #Check if 204 OK is received
  assert_equal(204, response.code, "No Content! Response: #{response}")
end

def delete_environments_prod

  response = delete("http://www.apimation.com/environments/"+@test_environment_PROD.id,
                    headers: {},
                    cookies: @test_user.session_cookie)


  #Check if 204 OK is received
  assert_equal(204, response.code, "No Content! Response: #{response}")
end
