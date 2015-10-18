class ReturnUser < ActiveRecord::Base
  has_many :items
  validates :name, presence: true,  length: { maximum: 255 }
end
