require "geocoder/stores/active_record"

class Coffee < ApplicationRecord
  include Geocoder::Store::ActiveRecord

  def self.geocoder_options
    { latitude: 'latitude', longitude: 'longitude' }
  end
end
