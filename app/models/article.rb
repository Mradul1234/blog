class Article < ApplicationRecord
	acts_as_paranoid
    belongs_to :user
    has_many :article_groups
    has_many :groups, through: :article_groups
    validates :title, presence:true, length:{minimum:6, maximum:100}
    validates :description, presence:true, length:{minimum:20, maximum:200}
end
