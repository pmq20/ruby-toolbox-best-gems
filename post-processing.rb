notgems = []
File.open('./Gemfile') do |file|
  while line = file.gets
    if line[0]=='#'
      notgems << line.split('gem')[1]
    else
      lines = line.split(' ')
      next if 'source'==lines[0]
      str=lines[1][1..-2]
      print "gem install #{str}\n"
    end
  end
end

p notgems