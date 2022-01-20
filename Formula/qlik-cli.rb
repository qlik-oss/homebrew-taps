# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class QlikCli < Formula
  desc "qlik-cli is a Command Line Interface for Qlik Cloud."
  homepage ""
  version "2.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v2.8.0/qlik-Darwin-x86_64.tar.gz"
      sha256 "65bacceee4dc22e094e2e8949baec5a21023528e25126bb9ab21adcf837098ff"

      def install
        bin.install "qlik"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/qlik-trial/qlik-cli/releases/download/v2.8.0/qlik-Linux-x86_64.tar.gz"
      sha256 "0f7d336a2047d229052c16187559e563642f526f3ab715ca2a1f6a61709e746b"

      def install
        bin.install "qlik"
      end
    end
  end

  test do
    assert_equal "qlik version: #{version}", shell_output("#{bin}/qlik version").chomp
  end
end
