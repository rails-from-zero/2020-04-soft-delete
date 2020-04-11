class Comment < ApplicationRecord
  include Deletable

  belongs_to :user
  belongs_to :post, counter_cache: true

  after_soft_destroy :decrement_counter_cache

  private

  def decrement_counter_cache
    association(:post).decrement_counters
  end
end
