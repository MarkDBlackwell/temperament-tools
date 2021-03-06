=begin
Author: Mark D. Blackwell
See:
  http://huygens-fokker.org/scala/scl_format.html
=end

require_relative 'lib.rb'

def main
  header_process
  values_process
  puts mirror
  nil
end

def values_process
  until lines_input.empty? do
    line = lines_input.pop
# Print the scale values:
    blob = blob_first(line)
    if blob.empty?
      mirror.push line
      next
    end
    unless blob.match(digits_dot_regexp).to_s.empty?
      mirror.push " #{blob.to_f}"
      next
    end
    a = blob.split('/')
    s = [a.first, '/', a.last].join('')
    mirror.push " #{s}"
  end
  nil
end

main
