class Service < ActiveRecord::Base
  has_many :snippets
  has_many :articles

  before_save :make_short_upcase

  validates :title, uniqueness: true, presence: true
  validates :short, uniqueness: true, presence: true

  private

  def make_short_upcase
    self.short = self.short.upcase
  end
end
