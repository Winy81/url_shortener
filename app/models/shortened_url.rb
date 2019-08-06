class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true
  validates_format_of :original_url, :multiline => true, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  before_create :generate_short_url
end

def generate_short_url
  url = ([*('a'..'z'),*('0'..'9')]).sample(8).join.date_filter
  old_url = ShortenedUrl.where(short_url: url).last
  if old_url.present?
    self.generate_short_url
  else
    self.short_url = url
  end
end

public

def date_filter
  date = Date.today.month.to_s
  self << date
end
