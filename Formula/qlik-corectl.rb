class QlikCorectl < Formula
  desc "Corectl is a CLI tool for using Qlik Associative Engine"
  homepage "https://github.com/qlik-oss/corectl"
  url "https://github.com/qlik-oss/corectl/archive/v1.1.1.tar.gz"
  sha256 "e0c33093936218932031cbaa3135efe84506cbb7a4a54dacefda299179381301"

  bottle do
    root_url "https://github.com/qlik-oss/homebrew-taps/tree/master/bottles"
    sha256 "3183bb78b19c0bf964d87b3256f560f8f2878b8a1e8b48b06925723531b1c69e" => :mojave
    sha256 "4e4b9e1f723a8169d68aac026cb1b2eea1c622654ddf83ad4402223a4432bc00" => :x86_64_linux
  end

  depends_on "go" => [:build, "1.11"]

  def install
    system "go build -ldflags \"-X main.version=#{version}\""
    bin.install "corectl"
  end

  test do
    assert_equal "corectl version: #{version}", shell_output("#{bin}/corectl version").chomp
  end
end
