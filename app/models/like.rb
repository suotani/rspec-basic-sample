class Like < ApplicationRecord
  # Like１レコード = あるユーザーがあるtodoにいいねをした = 1つ分のいいね

  belongs_to :todo 
  belongs_to :user

  validates :user_id, uniqueness: {scope: :todo}

end
