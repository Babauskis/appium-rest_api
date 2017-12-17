Before() do
  puts "Before hook. This will work before every test case!"
  @test_user = User.new( '','babauskis2@gmail.com', 'parole123')
end