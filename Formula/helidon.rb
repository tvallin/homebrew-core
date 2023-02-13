class Helidon < Formula
  desc "Set of Java libraries for writing microservices that run on Netty"
  homepage "https://helidon.io/"
  url "file:///Users/tvallin/workspace/helidon-build-tools/cli/impl/target/distribution/helidon.zip"
  version "3.0.0"
  # change to final sha256
  sha256 "b9627751265a72a532a8bfc539e3386b5fc52bae8cd7ddd854b366b5f55d3c91"
  license "Apache-2.0"

  def install
    mkdir_p libexec/"bin"
    mv "bin/helidon", libexec/"bin/helidon"
    mv "lib", libexec/"lib"
    (bin/"helidon").write_env_script libexec/"bin/helidon", Language::Java.overridable_java_home_env("17")
  end

  test do
    system "#{bin}/helidon", "init", "--batch"
    assert_predicate testpath/"quickstart-se", :directory?
  end
end
