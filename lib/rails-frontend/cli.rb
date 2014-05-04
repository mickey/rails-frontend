require 'clamp'
require 'erb'
require 'tilt'
require 'find'
require 'active_support'
require 'active_support/core_ext/string'

module RailsFrontend
  class CLI < Clamp::Command
    subcommand "new", "Generate a new rails-frontend application" do
      parameter "NAME", "name of your application", attribute_name: :name

      def execute
        working_dir = Dir.pwd
        template_dir = File.join(File.expand_path('../../../template', __FILE__))
        destination_dir = "#{working_dir}/#{name}/"

        if Dir.exists?(destination_dir)
          puts "Error: #{destination_dir} already exists"
          return
        end

        Dir.mkdir destination_dir

        Find.find(template_dir) do |template_obj|
          next if template_obj == template_dir

          destination = "#{destination_dir}#{template_obj.gsub("#{template_dir}", "")}"
          if File.directory?(template_obj)
            Dir.mkdir destination
          else
            if File.extname(template_obj) == ".erb"
              template = Tilt.new(template_obj)
              output = template.render(self)

              File.open(destination.gsub(".erb", ""), "w+") { |file| file.puts(output) }
            else
              FileUtils.cp(template_obj, destination)
            end
          end
        end
      end

    end
  end
end
