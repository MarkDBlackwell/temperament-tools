=begin
Author: Mark D. Blackwell
=end

def comment_indicator
  '!'
end

def content_line_second(file)
  result = ''
  position = 0
  file.readlines.each do |line|
    next if line.lstrip.start_with?(comment_indicator)
    position += 1
    if 2 == position 
      result = line
      break
    end
  end
  result
end

def directory_current_process
  result = []
  dir_here = ::Dir.pwd
  ::Dir.each_child(dir_here) do |filename|
    ::File.open(filename) do |file|
      line = content_line_second(file)
      if is_twelve?(line)
        result.push filename
      else
        octave_size_other_process(line)
      end
    end
  end
  result
end

def is_twelve?(line)
  '12' == line.strip
end

def octave_size_other_process(line)
# puts line.lstrip
  nil
end

def run
  puts directory_current_process
  nil
end

run
