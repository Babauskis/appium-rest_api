def choose_existing_project
    project_payload = {:name => @test_project.name,
                       :type => @test_project.type}.to_json

    response = put("http://www.apimation.com/projects/active/"+@test_project.id,
                    headers: {'Content-Type' => 'application/json'},
                    cookies: @test_user.session_cookie,
                    payload: project_payload)

    #Check if 200 OK is received
    assert_equal(204, response.code, "Wrong error code received! Response: #{response}")
end


def create_request_collection
    @test_api = Collection.new( '','TESTAPI', '')
    project_payload = {:name => @test_api.name
                                                    }.to_json

    response = post("http://apimation.com/collections",
                    headers: {'Content-Type' => 'application/json'},
                    cookies: @test_user.session_cookie,
                    payload: project_payload)


    puts response.cookies
    #Check if 200 OK is received
    assert_equal(200, response.code, "Wrong error code receivedy! Response: #{response}")
    response_hash = JSON.parse(response)

    assert_equal(@test_api.name, response_hash['name'], 'Project exists!')
    assert_not_equal(nil, response_hash['id'], 'Project id is empty!')


    #{assert_equal(@test_.type, response_hash['type'], 'Error message is not correct!')

    @test_api.set_api_id(response_hash['id'])
    puts @test_api.id
    puts @test_api.name
end