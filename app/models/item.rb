class Item < ActiveRecord::Base
  before_save { self.title = title.downcase }
  validates :item_type, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :has_id, presence: true
  validates :where_found, presence: true
  validates :where_held, presence: true
  validates :description, presence: true, length: { maximum: 65536 }
end
