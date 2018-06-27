require 'tinypng_cli'
require 'thor'
require 'tinify'

module TinypngCli
  class CLI < Thor
    desc 'init {TINIFY_KEY}', 'Please obtain TINIFY_KEY from official page.'
    def init(str)
      File.open("#{Dir.home}/.tinypng_cli_tinify_key", 'w') { |f| f.write(str) }
    end

    desc 'convert {file_path} {file_path}', 'Run tinypng with cli. The image will be overwritten.'
    def convert(*args)
      Tinify.key = File.read("#{Dir.home}/.tinypng_cli_tinify_key")
      args.each do |path|
        p "convertint #{path}"
        source = Tinify.from_file(path)
        source.to_file(path)
      end
    end
  end
end
