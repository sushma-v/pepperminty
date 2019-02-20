require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:category_params) { {name: 'sales'} }
  let(:category) { Category.create! category_params }
  let(:post_params) { {title: 'Post1', content: 'Lorem Ipsum #best', alt_text: 'post1 alt text', category_id: category.id,
                       meta_description: 'post1 meta description', meta_keywords: 'post1 meta keywords', status: 'draft'} }
  let(:post_params_alt) { {title: 'Post1', content: 'Lorem Ipsum #seo', alt_text: 'post1 alt text', category_id: category.id,
                       meta_description: 'post1 meta description', meta_keywords: 'post1 meta keywords', status: 'draft'} }
  let(:edit_params_alt) { {title: 'Post1', content: 'Lorem Ipsum edited #best #ppc', alt_text: 'post1 alt text', category_id: category.id,
                           meta_description: 'post1 meta description', meta_keywords: 'post1 meta keywords', status: 'draft'} }

  context "create post" do
    before(:each){
      Post.create! post_params
    }

    it "should change post count by 1 and create hash_tag and category" do
      post = Post.first
      expect(Post.count).to eq 1
      expect(post.category.name).to eq category.name
      expect(post.hash_tags.count).to eq 1
      expect(post.post_hash_tags.count).to eq 1
      expect(PostHashTag.first.post_id).to eq post.post_hash_tags.first.post_id
      expect(PostHashTag.first.hash_tag_id).to eq post.post_hash_tags.first.hash_tag_id
      expect(post.hash_tags.first.name).to eq "best"
    end

    it "with same hash tag" do
      expect(Category.count).to eq 1
      expect(HashTag.count).to eq 1
      expect(PostHashTag.count).to eq 1

      post1 = Post.first
      post2 = Post.create! post_params
      expect(Post.count).to eq 2

      expect(post2.category.name).to eq category.name

      expect(post2.hash_tags.count).to eq 1
      expect(post2.hash_tags.first.name).to eq "best"

      expect(post2.post_hash_tags.count).to eq 1

      expect(Category.count).to eq 1
      expect(HashTag.count).to eq 1
      expect(PostHashTag.count).to eq 2
    end

    it "with new hash tag" do
      expect(Category.count).to eq 1
      expect(HashTag.count).to eq 1
      expect(PostHashTag.count).to eq 1

      post1 = Post.first
      post2 = Post.create! post_params_alt
      expect(Post.count).to eq 2

      expect(post2.category.name).to eq category.name

      expect(post2.hash_tags.count).to eq 1
      expect(post2.hash_tags.first.name).to eq "seo"

      expect(post2.post_hash_tags.count).to eq 1

      expect(Category.count).to eq 1
      expect(HashTag.count).to eq 2
      expect(PostHashTag.count).to eq 2
    end

  end

  context "update post" do
    before(:each){
      Post.create! post_params
    }

    it "should change post count by 1 and create hash_tag and category" do
      expect(Category.count).to eq 1
      expect(HashTag.count).to eq 1
      expect(PostHashTag.count).to eq 1

      post = Post.first
      post.update!(edit_params_alt)
      post.update_hash_tags

      expect(Post.count).to eq 1

      expect(post.category.name).to eq category.name

      expect(post.hash_tags.count).to eq 2
      expect(post.hash_tags.first.name).to eq "best"
      expect(post.hash_tags.last.name).to eq "ppc"

      expect(post.post_hash_tags.count).to eq 2

      expect(Category.count).to eq 1
      expect(HashTag.count).to eq 2
      expect(PostHashTag.count).to eq 2
    end

  end

  context "delete post" do
    before(:each){
      Post.create! post_params
    }

    it "should change post count by 1 and delete hash_tag relation" do
      post = Post.first
      post.destroy

      expect(Post.count).to eq 0
      expect(Category.count).to eq 1
      expect(HashTag.count).to eq 1
      expect(PostHashTag.count).to eq 0
    end
  end

  context "publish post" do
    before(:each){
      Post.create! post_params
    }
    it "check status" do
      post = Post.first
      expect(post.status).to eq "draft"

      post.published!
      expect(post.status).to eq "published"
    end
  end

end
