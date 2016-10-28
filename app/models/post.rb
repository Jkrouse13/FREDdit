class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :link, :vote
  validates :link, uniqueness: true
end
