# == Schema Information
#
# Table name: redactor_assets
#
#  id                 :integer          not null, primary key
#  asset_file_name    :string
#  asset_content_type :string
#  asset_file_size    :integer
#  asset_updated_at   :datetime
#

class RedactorAsset < ActiveRecord::Base
	has_attached_file :asset, styles: { original: "800x800>"}
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
end
