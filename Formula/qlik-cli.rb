# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Sense SaaS."
  homepage ""
  version "2.5.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v2.5.0/qlik-Darwin-x86_64.tar.gz"
      sha256 "4fdbe8c905f8a9fbe75498cda26e5d3639adf6008a3f35ef614a8a135748231d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v2.5.0/qlik-Linux-x86_64.tar.gz"
      sha256 "ef375636869fa538e2aff85c5713cff2ad5b252945670c47945e0352c39249b8"
    end
  end

  def install
    bin.install "qlik"
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
