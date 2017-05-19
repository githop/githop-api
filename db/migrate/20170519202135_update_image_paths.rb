class UpdateImagePaths < ActiveRecord::Migration[5.0]
  def up
    Image.all.each do |image|
      image.href.gsub!(/http/, 'https');
      image.save;
      end
  end
end
