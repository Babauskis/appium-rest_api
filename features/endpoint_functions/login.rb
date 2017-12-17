def login_positive
  @test_user = User.new( '','babauskis2@gmail.com', 'parole123')
  login_payload = {:login => @test_user.email,
                   :password => @test_user.password }.to_json
  response = post("https://www.apimation.com/login",
                  headers: {'Content-Type' => 'application/json'},
                  cookies: {},
                  payload: login_payload)
  #response = RestClient::Request.execute(method:  :post,
  #                                       url: "https://www.apimation.com/login",
  #                                       headers: {'Content-Type' => 'application/json'},
  #                                       cookies:{},
  #                                       payload: login_payload)
  #
  #Check if 200 OK is received
  assert_equal(200, response.code, "Login failed! Response : #{response}")



  response_hash = JSON.parse(response)

  assert_equal(@test_user.email, response_hash['email'], 'Email in the response is equal')

  assert_not_equal(nil, response_hash['user_id'], 'User id is empty!')

  assert_equal(@test_user.email, response_hash['login'], 'Login in the response is equal')


  @test_user.set_session_cookie(response.cookies)

  @test_user.set_used_id(response_hash['user_id'])
  puts @test_user.user_id
  puts @test_user.session_cookie
  # puts response_hash
  # puts response.code
  # puts response.headers
  # puts response.cookies
  # puts response.body
end

def check_personal_info

  response = get("https://www.apimation.com/user",
                 headers: {},
                 cookies: @test_user.session_cookie)

  #Check if 200 is OK
  assert_equal(200, response.code, "Failed to receive data! Response : #{response}")

  login_response_hash = JSON.parse(response)

  #Check if provided email is correct
  assert_equal(@test_user.email, login_response_hash['email'], 'The email in response is not correct!')

  #Check if provided ID is correct
  assert_equal(@test_user.user_id, login_response_hash['user_id'], 'The ID in response is not correct!')

end

def login_wrong_password
  login_payload = {:login => @test_user.email,
                   :password => 'nepareizaParole' }.to_json

  response = post("https://www.apimation.com/login",
                  headers: {'Content-Type' => 'application/json'},
                  cookies: {},
                  payload: login_payload)

  #Check if 200 OK is received
  assert_equal(400, response.code, "Wrong error code received! Response: #{response}")

  response_hash = JSON.parse(response)

  assert_equal('002', response_hash['error-code'], "Error code in response is not equal")

  assert_equal('Username or password is not correct', response_hash['error-msg'], 'Error message is not correct!')

  @test_user.set_session_cookie(response.cookies)
end

def check_user_not_logged
  puts 'Check if user is not logged in'
  response = get("https://www.apimation.com/user",
                 headers: {},
                 cookies: @test_user.session_cookie)

  assert_equal(400, response.code, "Wrong error code received! Response: #{response}")
  response_hash = JSON.parse(response)

  assert_equal('001', response_hash['error-code'], "Error code in response is not equal")

  assert_equal('No session', response_hash['error-msg'], 'Error message is not correct!')

  @test_user.set_session_cookie(response.cookies)
  #puts response
  #puts response.code
end