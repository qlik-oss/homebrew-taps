# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Sense SaaS."
  version "1.4.0"
  bottle :unneeded

  if OS.mac?
    url "https://raw.githubusercontent.com/qlik-oss/homebrew-taps/master/bin/qlik-cli/v1.4.0/qlik-Darwin-x86_64.tar.gz"
    sha256 "a3dea1022e81a575f8e35f49fa4047d21ec51a2761c39ba41651f9d4c565e42d"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/qlik-oss/homebrew-taps/master/bin/qlik-cli/v1.4.0/qlik-Linux-x86_64.tar.gz"
      sha256 "5e481e05f2f94ced0c9cae1bdc35c78d5f3afed611059321fc8ebbdb4a21c6b2"
    end
  end

  def install
    bin.install "qlik"
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
