require 'rails_helper'

RSpec.describe Comment do
  shared_context "existing records" do
    let!(:comment1) { FactoryBot.create(:comment, deleted_at: 3.days.ago) }
    let!(:comment2) { FactoryBot.create(:comment) }
  end

  describe "#soft_destroy" do
    subject(:soft_destroy) { comment.soft_destroy }

    let(:comment) { FactoryBot.create(:comment) }

    it "sets the deleted_at attribute" do
      expect { soft_destroy }.to change { comment.deleted_at }.from(nil)
    end
  end

  describe ".all" do
    include_context "existing records"

    subject { Comment.all }

    it { is_expected.to eq([comment2]) }
  end

  describe ".with_deleted" do
    include_context "existing records"

    subject { Comment.with_deleted }

    it { is_expected.to match_array([comment1, comment2]) }
  end

  describe ".only_deleted" do
    include_context "existing records"

    subject { Comment.only_deleted }

    it { is_expected.to eq([comment1]) }
  end
end
