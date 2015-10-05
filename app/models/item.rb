class Item < ActiveRecord::Base
  belongs_to :building
  before_save { self.title = title.downcase }
  validates :item_type, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates_inclusion_of :has_id, in: [true, false]
  validates :where_found, presence: true
  validates :building_id, presence: true
  validates :description, presence: true, length: { maximum: 65536 }
end
