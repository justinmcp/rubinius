# Add a Rubinius platform to the platforms list.
cpu = Gem::Platform.local.cpu
version = Rubinius::VERSION.split('.')[0, 2].join '.'
Gem.platforms << Gem::Platform.new([cpu, 'rubinius', version])

module Gem
  def self.default_bindir
    File.join Rubinius::GEMS_PATH, "bin"
  end

  def self.default_dir
    File.join Rubinius::GEMS_PATH, Gem::ConfigMap[:ruby_version]
  end

  def self.default_preinstalled_dir
    version = Rubinius::VERSION.split('.')[0, 2].join '.'
    pre_installed = File.join Rubinius::GEMS_PATH, "rubinius", version
  end

  def self.default_path
    [default_dir, default_preinstalled_dir]
  end
end

