class Post < ActiveRecord::Base
    belongs_to :user, index: true
    has_many :posts_tags
    has_many :tags, :through => :post_tag
end