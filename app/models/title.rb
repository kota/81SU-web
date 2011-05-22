class Title < ActiveRecord::Base
  has_many :players_titles
  has_many :players, :through => :players_titles
end
