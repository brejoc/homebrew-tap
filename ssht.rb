require 'formula'

class Ssht < Formula
  homepage 'https://github.com/brejoc/ssht/'
  url 'https://github.com/brejoc/ssht/archive/0.4.tar.gz'
  sha256 '44bc1f6c2e5d80edc87de7a84bfd4bb90cf365219ec954fa1de01ecf4c4aec08'

  head 'https://github.com/brejoc/ssht.git', :revision => '0fffd24d8c96caac93a19078af15b66de88e84de'

  def install
    bin.install "ssht"
  end
end
