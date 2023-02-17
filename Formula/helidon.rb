class Helidon < Formula
  desc "CLI to easily create a Helidon project by picking from a set of archetypes"
  homepage "https://helidon.io/"
  url "https://search.maven.org/remotecontent?filepath=io/helidon/build-tools/cli/helidon-cli-impl/3.0.4/helidon-cli-impl-3.0.4.zip"
  version "3.0.0"
  # change to final sha256
  sha256 "4eadf18d977c18858043700ea4745628c9620a73d96d47a6a4ba0a9fa407cdec"
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
