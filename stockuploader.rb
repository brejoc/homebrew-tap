require 'formula'

GOPATH = ENV.fetch("HOMEBREW_TEST_TMPDIR") do |k|
  dir = Dir.mktmpdir("homebrew-tests-", ENV["HOMEBREW_TEMP"] || "/tmp")
  at_exit { FileUtils.remove_entry(dir) }
  ENV[k] = dir
end

class Stockuploader < Formula
  homepage 'https://github.com/brejoc/stockuploader'
  url 'https://github.com/brejoc/stockuploader/archive/0.1.tar.gz'
  sha256 'fe31a05af3255a5d8808282e49762245895e85c21e3ad561d7e78bd17c2edceb'

  head 'https://github.com/brejoc/stockuploader.git', :revision => 'f2e391f5267ae1194c4ffd699a5300df0089db03'

  depends_on "golang" => :build

  def install
    system "GOPATH=#{GOPATH} go build"
    bin.install "stockuploader"
  end
end
