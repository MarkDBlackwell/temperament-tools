=begin
Author: Mark D. Blackwell
See:
  http://huygens-fokker.org/scala/scl_format.html
=end

require_relative 'lib.rb'

def line_value(line)
  blob = blob_first(line)
  return nil if blob.empty?
  return blob.to_f unless blob.match(digits_dot_regexp).to_s.empty?
  return blob if blob.start_with?('-')
  a = blob.split('/').map{|e| e.to_f}
  ratio = a.first / a.last
  ::Math.log2(ratio) * 1200
end

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
