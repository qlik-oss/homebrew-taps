class QlikCorectl < Formula
  desc "Corectl is a CLI tool for using Qlik Associative Engine"
  homepage "https://github.com/qlik-oss/corectl"
  url "https://github.com/qlik-oss/corectl/archive/v1.3.0.tar.gz"
  sha256 "a5eb168d0bf79671c238557a65cfa882479955c6de2903784e1185a18ab64c40"

  def install
    bin.install "corectl"
  end

  test do
    assert_equal "corectl version: #{version}", shell_output("#{bin}/corectl version").chomp
  end
end
