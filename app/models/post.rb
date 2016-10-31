class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subfred
  validates :link, uniqueness: true

end
