class Sdimport < Formula
  desc "Import RAW photos from an SD card into a date-organized event folder"
  homepage "https://gitlab.com/brejoc/sdimport"
  url "https://gitlab.com/brejoc/sdimport/-/archive/1.0/sdimport-1.0.tar.gz"
  sha256 "6415b050be04d90a575027eb29c8e9dad7f12e1762d0bb7df50576a964e228c7"
  license "MIT"

  head "https://gitlab.com/brejoc/sdimport.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "sdimport", "."
    bin.install "sdimport"
  end
end
