require 'formula'

class Gosgp < Formula
  homepage 'https://github.com/brejoc/gosgp'
  url 'https://github.com/brejoc/gosgp/archive/0.1.tar.gz'
  sha256 '1b55d36b7fc6b7974cb26b8fde808db94d6eb865815ebfc7bc37cd391c1eec29'

  head 'git@github.com:brejoc/gosgp.git', :revision => '0faceae29ec79b636fe3589601e75e0d577375f8'

  depends_on "golang" => :build

  def install
    system "GOPATH=/tmp/gopath go get -d"
    system "GOPATH=/tmp/gopath go build -o gosgp"
    bin.install "gosgp"
  end
end
