# == Schema Information
#
# Table name: cards
#
#  id            :integer          not null, primary key
#  deck_id       :integer          not null
#  question_text :text             not null
#  answer_text   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Card < ActiveRecord::Base
  validates :deck, :question_text, presence: true;

  belongs_to :deck

  has_many :confidence_ratings

  def current_user_rating
    rating = ConfidenceRating.find(card: self, user: current_user)
    return 0 unless rating
    rating
  end

end
