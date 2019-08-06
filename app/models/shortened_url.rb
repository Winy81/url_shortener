class ShortenedUrl < ApplicationRecord
  validates :original_url, presence: true
  #regex validation for valid url, this version working with "http://" and "https://" but not with www
  validates_format_of :original_url, :multiline => true, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  before_create :generate_short_url
end

#generate a 8 caracter long random sting used as short_url
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

#add an extra or 2 extra caracters on the end of the short_url. depend on current month to help avoid duplication
def date_filter
  date = Date.today.month.to_s
  self << date
end
