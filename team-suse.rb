require 'formula'

class TeamSuse < Formula
  homepage 'https://github.com/brejoc/gosgp'
  url 'https://github.com/brejoc/team-suse/archive/0.1.tar.gz'
  sha256 '35f81984e71adc61515aa46593201624c4871ec47ee8c5a3fbb7214fa9605de4'

  head 'git@github.com:brejoc/team-suse.git', :revision => '79424184caf83ab6af72a3cb4390c2367b2a77a6'

  depends_on "golang" => :build

  def install
    system "GOPATH=/tmp/gopath go get -d"
    system "GOPATH=/tmp/gopath go build -o team-suse"
    bin.install "team-suse"
    system "rm -rf /tmp/gopath"
  end
end
