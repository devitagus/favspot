class Usertag < ActiveRecord::Base
  belongs_to :savedplace
  validates :tag, presence: true, uniqueness: { scope: :savedplace }
end
