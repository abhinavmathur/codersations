class Contributor < ActiveRecord::Base
  belongs_to :member, class_name: 'User'
  belongs_to :tutorial
end
