class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

has_one_attached :avatar
has_many :tweets
has_many :comments
 
   acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #has_many :follows, foreign_key: "follower_id", dependent: :destroy
    has_many :active_follows, class_name: "Follow", foreign_key: "follower_id"

     has_many :following, through: :active_follows, source: :followed

   has_many :passive_follows, class_name: "Follow", foreign_key: "followed_id"

   has_many :followers, through: :passive_follows, source: :follower
 # def self.a1
 # 	puts 'ram'
 # end

 def follow(user)
   active_follows.create(followed_id: user.id)
  
 end

   def unfollow(user)
  active_follows.find_by(followed_id: user.id).destroy

 end
 def following?(user)
  following.include?(user)
 end
end
