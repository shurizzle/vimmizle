#!/usr/bin/env ruby

begin
  require 'github/markup'
rescue
  $stderr.puts 'Please install github-markup'
  exit 1
end

exit 1 if ARGV.size != 1

unless GitHub::Markup.can_render?(ARGV[0])
  $stderr.puts "Can't render #{ARGV[0]}, please install required gem."
  exit 1
end

begin
  html = GitHub::Markup.render(ARGV[0], File.read(ARGV[0]))
  puts '<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><title>'
  puts ARGV[0]
  puts '</title><style>'
  puts File.read(File.realpath(File.join(__FILE__, '..', 'ghf_marked.css'))) rescue nil
  puts '</style></head><body>'
  puts html
  puts '</body></html>'
rescue
  $stderr.puts 'Unknown error'
  exit 1
end
