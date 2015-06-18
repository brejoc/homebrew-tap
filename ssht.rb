require 'formula'

class Ssht < Formula
  homepage 'https://github.com/brejoc/ssht/'
  url 'https://github.com/brejoc/ssht/archive/0.4.tar.gz'
  sha1 '1ac2c7e44e173baa157c91226374bfc44f61a247'

  head 'https://github.com/brejoc/ssht.git', :revision => '0fffd24d8c96caac93a19078af15b66de88e84de'

  def install
    bin.install "ssht"
  end
end
