require 'formula'

GOPATH = ENV.fetch("HOMEBREW_TEST_TMPDIR") do |k|
  dir = Dir.mktmpdir("homebrew-tests-", ENV["HOMEBREW_TEMP"] || "/tmp")
  at_exit { FileUtils.remove_entry(dir) }
  ENV[k] = dir
end

class Bscdiff < Formula
  homepage 'https://github.com/brejoc/bscdiff'
  url 'https://github.com/brejoc/bscdiff/archive/1.0.tar.gz'
  sha256 '68c90b5fa3766d23fa4ec7918bb1bce9c93926178601281e54aa1f58b52783be'

  head 'https://github.com/brejoc/bscdiff.git', :revision => '42898eb6b57021db333a01fde19065ffdbdb4602'

  depends_on "golang" => :build

  def install
    system "GOPATH=#{GOPATH} go build bscdiff.go"
    bin.install "bscdiff"
  end
end
