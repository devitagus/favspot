class Savedplace < ActiveRecord::Base
  belongs_to :place
  belongs_to :user
  belongs_to :usertag
  belongs_to :usertip
  belongs_to :userpic
end
