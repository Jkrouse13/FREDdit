class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subfred
  has_many :votes
  validates_presence_of :title, :link
  validates :link, uniqueness: true

end
