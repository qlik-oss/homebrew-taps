class QlikCorectl < Formula
  desc "Corectl is a CLI tool for using Qlik Associative Engine"
  homepage "https://github.com/qlik-oss/corectl"
  url "https://github.com/qlik-oss/corectl/archive/v1.1.1.tar.gz"
  sha256 "6c5528fd9a4414fcbe21bd0b451a71a6aee6ebad3820fdc9adb0c6a6886ff52c"

  depends_on "go" => [:build, "1.11"]

  def install
    system "go build -ldflags \"-X main.version=#{version}\""
    bin.install "corectl"
  end

  test do
    assert_equal "corectl version: #{version}", shell_output("#{bin}/corectl version").chomp
  end
end
