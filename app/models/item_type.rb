class ItemType < ActiveRecord::Base
  has_many :items
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
end
