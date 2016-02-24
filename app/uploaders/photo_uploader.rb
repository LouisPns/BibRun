# encoding: utf-8


class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:

