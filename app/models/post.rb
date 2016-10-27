class Post < ApplicationRecord

  validates_presence_of :title, :link, :vote, :author

end
