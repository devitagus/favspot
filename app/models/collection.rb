class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :collectedplaces
  has_many :savedplaces, through: :collectedplaces
end
