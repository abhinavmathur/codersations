class Purchase < ActiveRecord::Base
  before_create :populate_guid
  belongs_to :users
  belongs_to :tutorials

  def populate_guid
    self.guid = SecureRandom.hex(10)
  end
end
