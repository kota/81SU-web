class Kifu < ActiveRecord::Base
  belongs_to :black, :class_name => 'Player',:foreign_key => :blackid
  belongs_to :white, :class_name => 'Player',:foreign_key => :whiteid
end
