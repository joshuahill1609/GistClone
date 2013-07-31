class Gist < ActiveRecord::Base
   attr_accessible :title, :user_id

   belongs_to :user

   has_many :favorites

   validates :title, :user_id, presence: true

   def as_json(options={})
     {
       id: self.id,
       title: self.title,
       username: self.user.username
     }
   end
end
