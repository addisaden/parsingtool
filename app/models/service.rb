class Service < ActiveRecord::Base
  has_many :snippets, dependent: :destroy
  has_many :articles, dependent: :destroy

  before_save :make_short_upcase

  validates :name, uniqueness: true, presence: true
  validates :short, uniqueness: true, presence: true

  private

  def make_short_upcase
    self.short = self.short.upcase
  end
end
