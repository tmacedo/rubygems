class Gem::Ext::CmakeBuilder < Gem::Ext::Builder

  MAKE_TARGETS = ['', 'install'] # :nodoc:

  def self.build(extension, directory, dest_path, results)
    unless File.exist?('Makefile') then
      cmd = "cmake . -DCMAKE_INSTALL_PREFIX=#{dest_path}"
      cmd << " #{Gem::Command.build_args.join ' '}" unless Gem::Command.build_args.empty?

      run cmd, results
    end

    make dest_path, results

    results
  end
end
