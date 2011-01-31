task :create_servers => [:environment] do
  Server.create({:name => 'EARTH',:population => 0})
  Server.create({:name => 'MARS',:population => 0})
end
