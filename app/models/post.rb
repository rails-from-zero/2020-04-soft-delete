class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :title, :content, :user,
            presence: true

  before_destroy :ensure_no_comments

  private

  def ensure_no_comments
    throw :abort if comments.any?
  end
end
