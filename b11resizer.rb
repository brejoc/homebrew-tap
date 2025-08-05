require 'formula'

VERSION="0.1"

GOPATH = ENV.fetch("HOMEBREW_TEST_TMPDIR") do |k|
  dir = Dir.mktmpdir("homebrew-tests-", ENV["HOMEBREW_TEMP"] || "/tmp")
  at_exit do
    # Ensure all files are writable before removing the directory
    FileUtils.chmod_R('u+rwx', dir)
    FileUtils.remove_entry(dir)
  end
  ENV[k] = dir
end

class B11resizer < Formula
  homepage 'https://gitlab.com/brejoc/b11resizer/'
  url "https://gitlab.com/brejoc/b11resizer/-/archive/#{VERSION}/b11resizer-#{VERSION}.tar.gz/"
  sha256 'f1bb989ed3e2ba970fcb663b0c6856e2748168c880d47c545ffcd077bd78f694'

  head do
    url 'https://gitlab.com/brejoc/b11resizer.git', :branch => 'main'
  end


  depends_on "golang" => :build

  def install
    if build.head?
      VERSION.replace "development"
    end

    system "GOPATH=#{GOPATH} go build -ldflags=\"-X 'main.Version=#{VERSION}'\""
    bin.install "b11resizer"
  end
end
