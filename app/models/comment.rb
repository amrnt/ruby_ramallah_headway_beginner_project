class Comment < ActiveRecord::Base
  attr_accessible :msg, :author

  belongs_to :post
end
