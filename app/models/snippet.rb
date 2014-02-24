class Snippet < ActiveRecord::Base
  belongs_to :service

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :service_id
  validates :source, presence: true

  def parse(content)
    return self.source % content
  end
end
