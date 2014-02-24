class Article < ActiveRecord::Base
  belongs_to :service

  validates :title, uniqueness: true, presence: true
  validates :text, uniqueness: true, presence: true
end
