class Post < ApplicationRecord
  has_one_attached :image
belongs_to :user
has_many :post_tag_relations, dependent: :destroy
has_many :tags, through: :post_tag_relations, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :liked_users, through: :likes, source: :user
has_many :comments, dependent: :destroy
validates :title,presence:true
validates :impression,presence:true, length:{maximum: 200}
validates :address,presence:true


   def self.search(method,word)
                if method == "forward_match"
                        @posts = Post.where("text LIKE?","#{word}%")
                elsif method == "backward_match"
                        @posts = Post.where("text LIKE?","%#{word}")
                elsif method == "perfect_match"
                        @posts = Post.where("#{word}")
                elsif method == "partial_match"
                        @posts = Post.where("text LIKE?","%#{word}%")
                else
                        @posts = Post.all
                end
   end
end
