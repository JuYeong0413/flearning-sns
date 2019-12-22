class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User" # user 모델을 참고해서 follower를 찾아와라
  belongs_to :followed, class_name: "User"
end
