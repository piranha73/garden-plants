class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, :image_url, :garden_id, presence: true
end
