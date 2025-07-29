require 'formula'

class Gosgp < Formula
  homepage 'https://github.com/brejoc/gosgp'
  url 'https://github.com/brejoc/gosgp/archive/0.1.3.tar.gz'
  sha256 'ec30e48b24ddee10d8c788da04e7445e670633666a2f7c08dd20c9eb67c6a157'

  head 'git@github.com:brejoc/gosgp.git', :revision => '4678698f798974bf70eb798cb34ff22ab62c52c3'

  depends_on "golang" => :build

  def install
    system "go build -o gosgp"
    bin.install "gosgp"
  end
end
