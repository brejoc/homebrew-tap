require 'formula'

GOPATH = ENV.fetch("HOMEBREW_TEST_TMPDIR") do |k|
  dir = Dir.mktmpdir("homebrew-tests-", ENV["HOMEBREW_TEMP"] || "/tmp")
  at_exit { FileUtils.remove_entry(dir) }
  ENV[k] = dir
end

class TeamSuse < Formula
  homepage 'https://github.com/brejoc/gosgp'
  url 'https://github.com/brejoc/team-suse/archive/0.1.tar.gz'
  sha256 '35f81984e71adc61515aa46593201624c4871ec47ee8c5a3fbb7214fa9605de4'

  head 'https://github.com/brejoc/team-suse.git', :revision => '6d558807d4f3fe740e00210db516444713324071'

  depends_on "golang" => :build

  def install
    system "GOPATH=#{GOPATH} go get -d"
    system "GOPATH=#{GOPATH} go build -o team-suse"
    bin.install "team-suse"
  end
end
