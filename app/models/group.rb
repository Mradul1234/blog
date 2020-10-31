class Group < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    has_many :article_groups
    has_many :articles, through: :article_groups
end