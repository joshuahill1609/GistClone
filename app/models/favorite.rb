class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :gist_id

  validates :user_id, :gist_id, presence: true
  validates :user_id, uniqueness: {scope: :gist_id}

  belongs_to :user
  belongs_to :gist

  def as_json(options={})
    {
      gist_id: self.gist_id
    }
  end
end