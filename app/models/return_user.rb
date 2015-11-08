class ReturnUser < ActiveRecord::Base
  has_many :items
  validates :name, presence: true,  length: { maximum: 255 }
  validates :gtid, uniqueness: true, if: :gtid?
  validates :state_id, presence: true, uniqueness: true, unless: :gtid?
end
