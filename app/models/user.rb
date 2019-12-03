class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts # posts라는 메서드가 활성화됨, 반드시 복수로 써 줄 것
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post # likes를 통해서 user가 좋아하는 post를 모두 가져와라
  # user 입장에서 좋아하는 글들을 가져오는데 그걸 찾아올 때 likes를 토대로 찾게되고 likes 속에서 post인 애들만 묶음으로 보여준다는 의미

  def is_like?(post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end

end
