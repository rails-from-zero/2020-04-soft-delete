require 'rails_helper'

RSpec.describe Post do
  describe "#soft_destroy" do
    subject(:soft_destroy) { post.soft_destroy }

    let!(:post) { FactoryBot.create(:post) }

    it "removes record" do
      expect { soft_destroy }.to change { Post.count }.by(-1)
    end

    context "with existing comments" do
      let!(:comment) { FactoryBot.create(:comment, post: post) }

      it "removes record" do
        expect { soft_destroy }.to_not change { Post.count }
      end
    end
  end
end
