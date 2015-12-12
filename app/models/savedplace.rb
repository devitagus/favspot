class Savedplace < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :usertips
end
