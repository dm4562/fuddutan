class Item < ActiveRecord::Base
  belongs_to :building
  belongs_to :item_type
  belongs_to :return_user
  before_save { self.title = title.downcase }
  validates :item_type_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates_inclusion_of :has_id, in: [true, false]
  validates :where_found, presence: true
  validates :building_id, presence: true
  validates :description, presence: true, length: { maximum: 65536 }
end
