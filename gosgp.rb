require 'formula'

class Gosgp < Formula
  homepage 'https://github.com/brejoc/gosgp'
  url 'https://github.com/brejoc/gosgp/archive/0.1.2.tar.gz'
  sha256 'a864a1a0105a6d721de5e845c8c1ee0524b03936b007b4b7c99e6e57d0237163'

  head 'git@github.com:brejoc/gosgp.git', :revision => '6165666e234ca2f3a56b255261c4f5b40cc0bd37'

  depends_on "golang" => :build

  def install
    ENV["GOPATH"] = buildpath
    system "go get -d"
    system "go build -o gosgp"
    bin.install "gosgp"
  end
end
