require 'formula'

GOPATH = ENV.fetch("HOMEBREW_TEST_TMPDIR") do |k|
  dir = Dir.mktmpdir("homebrew-tests-", ENV["HOMEBREW_TEMP"] || "/tmp")
  at_exit { FileUtils.remove_entry(dir) }
  ENV[k] = dir
end

class Stockuploader < Formula
  homepage 'https://github.com/brejoc/stockuploader'
  url 'https://github.com/brejoc/stockuploader/archive/0.2.tar.gz'
  sha256 '97c54af083f180b55b739b5e7d0cc2fd1ebf1e03897c70d5df70db039556f8d3'

  head 'https://github.com/brejoc/stockuploader.git', :revision => '19177f4db4eb5a9ab92142242040e095e480dbe4'

  depends_on "golang" => :build

  def install
    system "GOPATH=#{GOPATH} go build"
    bin.install "stockuploader"
  end
end
