class Place < ActiveRecord::Base
  serialize :categories, Array
  serialize :photos, Array

  has_many :savedplaces
end
