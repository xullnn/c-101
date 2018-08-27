require 'open-uri'
require 'uri'

def safe_download(urls, directory)
  urls.each do |url|
    file = open(URI.encode(url))
    file_name = file.base_uri.path.split('/').last
    new_file = File.join(directory, file_name)
    if File.exist?(new_file)
      name = file_name.split('.').first
      type = file_name.split('.').last
      file_name = name + "(1)." + type
      new_file = File.join(directory, file_name)
    end
    File.open(new_file, 'w') { |f| f.puts file.read }
    puts new_file
  end
end


target_directory = '/Users/caven/favorite/'

source_urls = [
"https://s3-ap-southeast-1.amazonaws.com/image-for-articles/image-bucket-1/Snip20180323_40.png",
"https://s3-ap-southeast-1.amazonaws.com/image-for-articles/image-bucket-1/Snip20180323_41.png",
"https://s3-ap-southeast-1.amazonaws.com/image-for-articles/image-bucket-1/Snip20180323_42.png",
"https://s3-ap-southeast-1.amazonaws.com/image-for-articles/image-bucket-1/Snip20180323_43.png",
"https://s3-ap-southeast-1.amazonaws.com/image-for-articles/image-bucket-1/Snip20180323_44.png",
"https://s3-ap-southeast-1.amazonaws.com/image-for-articles/image-bucket-1/Snip20180323_45.png"
]

safe_download(source_urls, target_directory)
