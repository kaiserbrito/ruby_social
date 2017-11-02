class Post < ApplicationRecord
  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_user }
  mount_uploader :attachment, AvatarUploader
  belongs_to :user
end
