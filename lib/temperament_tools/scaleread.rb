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
# For now, print the scale values:
    value = line_value(line)
    unless value
      mirror.push line
    else
      mirror.push " #{value}"
    end
  end
  nil
end

main
