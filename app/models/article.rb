class Article < ActiveRecord::Base
  belongs_to :service

  validates :title, presence: true
  validates_uniqueness_of :title, scope: :service_id
  validates :text, presence: true
end
