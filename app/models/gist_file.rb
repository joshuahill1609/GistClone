class GistFile < ActiveRecord::Base
  attr_accessible :name, :body, :gist_id

  validates :name, :body, :gist_id, presence: true

  belongs_to :gist
end