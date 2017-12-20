Before() do
  puts "Before hook. This will work before every test case!"
  @test_user = User.new( '','babauskis2@gmail.com', 'parole123')
  @test_project = Project.new( '','', 'basic')
  @test_environment_DEV = Project.new( '','', '')
  @test_environment_PROD = Project.new('','','')
  @test_api = Collection.new( '','TESTAPI', '')
end

After() do
  puts "This happens after a test!"
end