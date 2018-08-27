puts musics = Dir['/Users/caven/Music/**/*.mp3'].shuffle

File.open("playlist.m3u", 'w') { |f| f.puts musics }
