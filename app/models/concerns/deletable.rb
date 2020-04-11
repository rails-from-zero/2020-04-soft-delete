module Deletable
  extend ActiveSupport::Concern

  included do
    default_scope -> { where(deleted_at: nil) }
    scope :with_deleted, -> { unscope(where: :deleted_at) }
    scope :only_deleted, -> { with_deleted.where.not(deleted_at: nil) }

    define_model_callbacks :soft_destroy

    def soft_destroy
      run_callbacks :soft_destroy do
        update_column("deleted_at", Time.now)
      end
    end
  end
end
