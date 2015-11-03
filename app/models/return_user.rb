class ReturnUser < ActiveRecord::Base
  has_many :items
  validates :name, presence: true,  length: { maximum: 255 }
  validates_presence_of :state_id, unless: :gtid?
  validates :gtid, uniqueness: true
  validates :state_id, uniqueness: true
end
