class Tweet < ApplicationRecord
	belongs_to :user, :optional => true

	 attr_accessor :like
     acts_as_votable cacheable_strategy: :update_columns
     has_one_attached :image
     has_many :comments
end
