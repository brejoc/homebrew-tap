require 'formula'

VERSION="0.2"

GOPATH = ENV.fetch("HOMEBREW_TEST_TMPDIR") do |k|
  dir = Dir.mktmpdir("homebrew-tests-", ENV["HOMEBREW_TEMP"] || "/tmp")
  at_exit { FileUtils.remove_entry(dir) }
  ENV[k] = dir
end

class Stockuploader < Formula
  homepage 'https://github.com/brejoc/stockuploader'
  url "https://github.com/brejoc/stockuploader/archive/#{VERSION}.tar.gz"
  sha256 '97c54af083f180b55b739b5e7d0cc2fd1ebf1e03897c70d5df70db039556f8d3'

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
