class Collectedplace < ActiveRecord::Base
  belongs_to :savedplace
  belongs_to :collection
end
