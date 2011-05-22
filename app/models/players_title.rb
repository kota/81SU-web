class PlayersTitle < ActiveRecord::Base
  belongs_to :player
  belongs_to :title
end
