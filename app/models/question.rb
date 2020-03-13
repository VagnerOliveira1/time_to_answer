class Question < ApplicationRecord
  belongs_to :subject
  has_many :answers


  paginates_per 10
end
