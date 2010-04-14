task :create_test_players => [:environment] do
  (101..1000).each{ |i|
    player = Player.new({:login => "test#{i}", :name => "test#{i}", :password => "monkey", :password_confirmation => "monkey", :email => "test#{i}@example.com"})
    player.save!
  }
end
