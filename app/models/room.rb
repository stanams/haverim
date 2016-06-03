class Room < ActiveRecord::Base
  belongs_to :user
  has_many :photos


  validates :home_type, :rrom_type, :accomodate, :bed_room, :bath_room,
            :listing_name, :summary, :address, :cacheroute, :is_cutlery, presence: true

  validates :listing_name, length: { maximum: 50 }
  validates :summary, length: { maximum: 500 }
  validates :cacheroute, length: { maximum: 600 }

end
