# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Sense SaaS."
  homepage ""
  version "0.6.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/qlik-trial/qlik-cli/releases/download/v0.6.0/qlik-Darwin-x86_64.tar.gz"
    sha256 "9ad102eba5c96a41a1b1269cccff419b2045c76c54d6770fd89d7d42431b4700"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v0.6.0/qlik-Linux-x86_64.tar.gz"
      sha256 "3feeb22093941cb3f1a1b85f02c1269bac4a39e5e70e9a00f98aacab3dbf47ad"
    end
  end

  def install
    bin.install "qlik"
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
