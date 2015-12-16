class Savedplace < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :usertips
  has_many :userpics
  has_many :collectedplaces
  has_many :collections, through: :collectedplaces
  has_many :user_places_categories

  after_create :map_categories_to_category

  CATEGORIES = ['Food & Drinks', 'Sightseeing', 'Shopping', 'Transport', 'Entertainment', 'Art & Culture', 'Sports', 'Nightlife', 'Relaxation']

  MAPPED_CATEGORIES = {
    'amusement_park' => 'Entertainment',
    'aquarium' => 'Entertainment',
    'art_gallery' => 'Art & Culture',
    'bakery' => 'Food & Drinks',
    'bar' => 'Food & Drinks',
    'bicycle_store' => 'Shopping',
    'book_store' => 'Shopping',
    'bowling_alley' => 'Entertainment',
    'bus_station' => 'Transport',
    'cafe' => 'Food & Drinks',
    'car_rental' => 'Transport',
    'casino' => 'Entertainment',
    'cemetery' => 'Sightseeing',
    'church' => 'Sightseeing',
    'city_hall' => 'Sightseeing',
    'clothing_store' => 'Shopping',
    'convenience_store' => 'Shopping',
    'department_store' => 'Shopping',
    'electronics_store' => 'Shopping',
    'florist' => 'Shopping',
    'food' => 'Food & Drinks',
    'furniture_store' => 'Shopping',
    'grocery_or_supermarket'  => 'Shopping',
    'gym' => 'Sports',
    'hardware_store' => 'Shopping',
    'hindu_temple' => 'Sightseeing',
    'home_goods_store' => 'Shopping',
    'jewelry_store' => 'Shopping',
    'library' => 'Art & Culture',
    'liquor_store' => 'Shopping',
    'meal_delivery' => 'Food & Drinks',
    'meal_takeaway' => 'Food & Drinks',
    'mosque' => 'Sightseeing',
    'movie_theater' => 'Entertainment',
    'museum' => 'Art & Culture',
    'night_club' => 'Nightlife',
    'park' => 'Sightseeing',
    'pet_store' => 'Shopping',
    'pharmacy' => 'Shopping',
    'place_of_worship' => 'Sightseeing',
    'restaurant' => 'Food & Drinks',
    'shoe_store' => 'Shopping',
    'shopping_mall' => 'Shopping',
    'spa' => 'Relaxation',
    'stadium' => 'Sport',
    'store' => 'Shopping',
    'subway_station' => 'Transport',
    'synagogue' => 'Sightseeing',
    'taxi_stand'  => 'Transport',
    'train_station' => 'Transport',
    'zoo' => 'Sightseeing',
    'natural_feature' => 'Sightseeing',
    'point_of_interest' => 'Sightseeing',
    'transit_station'  => 'Transport'
  }

  def map_categories_to_category
    self.place.categories.each do |category|
      if MAPPED_CATEGORIES[category]
        mapped_category = MAPPED_CATEGORIES[category]
        self.user_places_categories.create(savedplace: self, name: mapped_category)
      end
    end
  end
end
