class QlikCorectl < Formula
  desc "Corectl is a CLI tool for using Qlik Associative Engine"
  homepage "https://github.com/qlik-oss/corectl"
  url "https://github.com/qlik-oss/corectl/archive/v1.1.1.tar.gz"
  sha256 "e0c33093936218932031cbaa3135efe84506cbb7a4a54dacefda299179381301"

  bottle do
    root_url "https://github.com/qlik-oss/corectl/releases/download/v1.1.1/"
    sha256 "aecdcc0f34027f8949aeadd946fc71a2b2ca1cef5759a63c2203c1279c193719" => :mojave
    sha256 "c51d81ffe8566f44bde50235a9d4429b3c8edd520aeaecb67adf944a993d76fb" => :x86_64_linux
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
