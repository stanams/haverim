class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, :room_type, :accomodate, :bed_room, :bath_room,
            :listing_name, :summary, :address, :cacheroute, :is_cutlery, presence: true

  validates :listing_name, length: { maximum: 50 }
  validates :summary, length: { maximum: 500 }
  validates :cacheroute, length: { maximum: 600 }

end
