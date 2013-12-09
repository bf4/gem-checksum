require 'digest/sha2'
module GemChecksum
  class Checker

    def initialize(gem_path)
      @gem_path = gem_path
    end

    # Generate SHA512 hexdigest
    def generate_checksum
      @checksum ||= ::Digest::SHA512.new.hexdigest(read_gem)
    end

    def write_checksum(checksum_folder)
      fails "No such directory #{checksum_folder.inspect}" unless ::File.directory?(checksum_folder)
      checksum_path = ::File.join(checksum_folder, "#{gem_file_name}.sha512")
      ::File.open(checksum_path, 'w' ) {|f| f.write(generate_checksum) }
      "Wrote checksum to #{checksum_path}"
    end

    def validate_checksum(checksum)
      generate_checksum == checksum
    end

    private

    def read_gem
      ::File.binread(@gem_path)
    end

    def gem_file_name
      @gem_file_name ||= @gem_path.split(::File::SEPARATOR).find{|part| part =~ /\.gem\Z/ }
    end

  end
end
