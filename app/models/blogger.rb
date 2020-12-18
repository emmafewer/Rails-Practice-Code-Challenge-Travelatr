class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def top_post
        self.posts.max_by{|post| post.likes}
    end

    def total_likes
        self.posts.sum{|post| post.likes}
    end

    def top_five
        self.destinations.select{|destination| destination.posts}.max(5)
    end
end
