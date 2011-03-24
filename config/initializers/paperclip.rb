if Rails.env="macdev"
  Paperclip.options[:image_magick_path] = '/opt/local/bin'
else
  Paperclip.options[:image_magick_path] = '/usr/local/bin'
end
