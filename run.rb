#!/usr/bin/env ruby

case ARGV
in ["blocking", filename]
    require './blocking'
    BlockingOS.new(filename)
in ["generator", filename]
    require './generator'
    GeneratorOS.new(filename)
in [filename]
    require './generator'
    GeneratorOS.new(filename)
else
    puts "usage: run.rb [blocking|generator] <filename>"
end
