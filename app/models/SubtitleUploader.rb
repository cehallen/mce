class SubtitleUploader < CarrierWave::Uploader::Base
  storage :fog

  def initialize(*)
    super

    self.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'YOURAWSKEYID',
      aws_secret_access_key: 'YOURAWSSECRET',
    }
    self.fog_directory = "YOURBUCKET"
end
