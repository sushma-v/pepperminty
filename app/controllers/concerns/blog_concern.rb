module BlogConcern
  extend ActiveSupport::Concern

  def self.upload_image(main_image)
    Cloudinary::Uploader.upload(main_image, {folder: "/pepperminty/#{Rails.env}/blog/",
                                             use_filename: true})
  end
end