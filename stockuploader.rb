require 'formula'

VERSION="0.3"

GOPATH = ENV.fetch("HOMEBREW_TEST_TMPDIR") do |k|
  dir = Dir.mktmpdir("homebrew-tests-", ENV["HOMEBREW_TEMP"] || "/tmp")
  at_exit { FileUtils.remove_entry(dir) }
  ENV[k] = dir
end

class Stockuploader < Formula
  homepage 'https://github.com/brejoc/stockuploader'
  url "https://github.com/brejoc/stockuploader/archive/#{VERSION}.tar.gz"
  sha256 'c3668d6d4a94e3462365ef07f09511157cbef25458289f90ff6a9f267a88de3e'

  head do
    url 'https://github.com/brejoc/stockuploader.git', :branch => 'main'
  end


  depends_on "golang" => :build

  def install
    if build.head?
      VERSION.replace "development"
    end

    system "GOPATH=#{GOPATH} go build -ldflags=\"-X 'main.Version=#{VERSION}'\""
    bin.install "stockuploader"
  end
end
