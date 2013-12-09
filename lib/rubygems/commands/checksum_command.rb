require 'gem_checksum'
require 'rubygems/command'
class Gem::Commands::ChecksumCommand < Gem::Command

  def initialize
    super 'checksum', 'Calculate the checksum for a gem'

    add_option('--compare-to',
               'Boolean compare to the generated checksum') do
      |value, options|
      options[:compare_to] = value
    end

    add_option('--checksum-folder',
               'Folder to write generated checksum to') do
      |value, options|
      options[:checksum_folder] = value
    end

  end

  def arguments
    "GEM_NAME           the name of the gem you wish to hash"
  end

  def usage
    "#{program_name} GEM_NAME"
  end

  def description
    <<END
Calculcates the checksum for a gem
END
  end

  def execute
    gem_path = next_optional_arg
    fail "No .gem path passed in" if gem_path.nil?
    checker = GemChecksum::Checker.new(gem_path)

    say checksum = checker.generate_checksum

    say checker.write_checksum(next_optional_arg) if options[:checksum_folder]

    if options[:compare_to]
      compare_to = next_optional_arg
      if checker.validate_checksum(compare_to)
        say "Checksum validated"
      else
        say "Calculated checksum not equal to given checksum: " <<
            "\nExpected:\t#{compare_to}\nCalculcated:\t#{checksum}"
      end
    end
  end

  private

  def next_optional_arg
    options[:args].shift
  end

end
