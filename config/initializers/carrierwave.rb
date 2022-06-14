require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 保存先の分岐
CarrierWave.configure do |config|
# if Rails.env.production?
      config.storage = :fog
      config.fog_provider = 'fog/aws'
      config.asset_host = 'https://onsen3bucket.s3.amazonaws.com'
      config.fog_credentials = {
        # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['S3_REGION'],
      :aws_access_key_id     => ENV['S3_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['S3_SECRET_ACCESS_KEY']
      }
      config.fog_directory     =  ENV['S3_BUCKET']
      # config.cache_storage = :fog
    # else
    #   config.storage :file
    #   config.enable_processing = false if Rails.env.test? #test:処理をスキップ
    # end
 end