class UserPlacesCategory < ActiveRecord::Base
  belongs_to :savedplace
  validates :name, presence: true, uniqueness: { scope: :savedplace }
end
