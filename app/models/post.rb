class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subfred
  validates_presence_of :title, :link, :vote
  validates :link, uniqueness: true

end
