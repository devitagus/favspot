class Savedplace < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :usertips
  has_many :userpics
  has_many :collectedplaces
  has_many :collections, through: :collectedplaces
end
