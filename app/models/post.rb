class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subfred
  has_many :votes
  has_many :taggings
  has_many :tags, through: :taggings
  validates_presence_of :title, :link
  validates :link, uniqueness: true

end
