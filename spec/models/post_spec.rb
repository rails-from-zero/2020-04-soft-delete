require 'rails_helper'

RSpec.describe Post do
  describe "#destroy" do
    subject(:destroy) { post.destroy }

    let!(:post) { FactoryBot.create(:post) }

    it "removes record" do
      expect { destroy }.to change { Post.count }.by(-1)
    end

    context "with existing comments" do
      let!(:comment) { FactoryBot.create(:comment, post: post) }

      it "removes record" do
        expect { destroy }.to_not change { Post.count }
      end
    end
  end
end
