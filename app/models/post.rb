class Post < ApplicationRecord
  include Deletable

  has_many :comments, dependent: :destroy
  has_many :soft_deleted_comments,
           -> { only_deleted },
           class_name: "Comment",
           dependent: :destroy
  belongs_to :user

  validates :title, :content, :user,
            presence: true

  before_soft_destroy :ensure_no_comments,
                      prepend: true

  private

  def ensure_no_comments
    throw :abort if comments.any?
  end
end
