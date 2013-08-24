class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true
  validates :content, presence: true

  def posted_date
    self.created_at.to_formatted_s(:long_ordinal)[0..-6]
  end
end
