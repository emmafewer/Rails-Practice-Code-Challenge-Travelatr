class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent
        self.posts.order(created_at: :desc).limit(5)
        # self.posts.last(5)
    end

    def top_post
        self.posts.max_by{|post| post.likes}
    end

    def average_age
        self.bloggers.sum{|blogger| blogger.age} / self.bloggers.size
    end
end
