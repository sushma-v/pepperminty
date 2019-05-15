module BlogConcern
  extend ActiveSupport::Concern

  def self.upload_image(main_image)
    folder = "/pepperminty/#{Rails.env}/blog/"

    Cloudinary::Uploader.upload(main_image, {folder: folder,
                                             use_filename: true})
  end
end