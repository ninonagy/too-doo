class List < ApplicationRecord
  has_many :todos

  before_create :create_uuid_slug

  def create_uuid_slug
    self.title = "Untitled"
    self.slug = SecureRandom.uuid
  end
end
