# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Sense SaaS."
  homepage ""
  version "1.5.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/qlik-trial/qlik-cli/releases/download/v1.5.1/qlik-Darwin-x86_64.tar.gz"
    sha256 "1277e10022bae80b6826c8d0f30cf76a75a192cd3468a6c98e714a9d4dd31884"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v1.5.1/qlik-Linux-x86_64.tar.gz"
      sha256 "4fd2aa72755e72a166c94c636c5e86f78858e89f4289105d9827505050898650"
    end
  end

  def install
    bin.install "qlik"
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
