class Service < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
end
