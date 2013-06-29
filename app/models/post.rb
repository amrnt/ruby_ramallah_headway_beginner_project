class Post < ActiveRecord::Base
  attr_accessible :body, :published, :title

  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, presence: true, length: { in: 4..200 }

  after_save :generate_slug

  def generate_slug
    puts "#"*50
    puts self.title.downcase.gsub(" ", '-')
    puts "#"*50
  end
end
