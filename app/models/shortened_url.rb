class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true
  validates_format_of :original_url, :multiline => true, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  before_create :generate_short_url
end
