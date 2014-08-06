require 'rake'

namespace :gem do
  desc "Install the gem locally"
  task :install do
    puts "Building gem"
    `gem build httpping.gemspec`
    puts "Installing gem"
    `sudo gem install ./httpping-*.gem`
    puts "Removing built gem"
    `rm httpping-*.gem`
  end
end

namespace :git do
  desc "make a git tag"
  task :tag do
    version = `awk -F \\\" ' /version/ { print $2 } ' httpping.gemspec`
    version.chomp!
    puts "Tagging git with version=#{version}"
    system "git tag #{version}"
    system "git push --tags"
  end
end
