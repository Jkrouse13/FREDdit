class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subfred
  validates_presence_of :title, :link, :vote, :subfred
  validates :link, uniqueness: true

end
