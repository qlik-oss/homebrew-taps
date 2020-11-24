# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Sense SaaS."
  homepage ""
  version "1.6.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/qlik-trial/qlik-cli/releases/download/v1.6.0/qlik-Darwin-x86_64.tar.gz"
    sha256 "34299f790688597ece869e6631d060eff7c5a6710926542c746e5bcfcfe2b204"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/qlik-trial/qlik-cli/releases/download/v1.6.0/qlik-Linux-x86_64.tar.gz"
    sha256 "d36651801d39f25bdad288e30654a3910b12a37a69ce95f6165b2ee1fd7fbbb9"
  end

  def install
    bin.install "qlik"
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
