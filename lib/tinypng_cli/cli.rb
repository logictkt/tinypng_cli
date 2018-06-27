require "tinypng_cli"
require "thor"

module TinypngCli
  class CLI < Thor
    desc "camelize {snake_case_string}", "convert {snake_case_string} to {camelCaseString}"
    def camelize(str)
      puts str.split("_").map{|w| w[0] = w[0].upcase; w}.join
    end
  end
end
