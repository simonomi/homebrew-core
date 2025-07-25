class Wiki < Formula
  desc "Fetch summaries from MediaWiki wikis, like Wikipedia"
  homepage "https://github.com/walle/wiki"
  url "https://github.com/walle/wiki/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "529c6a58b3b5c5eb3faab07f2bf752155868b912e4f753e432d14040ff4f4262"
  license "MIT"

  no_autobump! because: :requires_manual_review

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia:  "f04d4a1f0e1ff026faa5c23ff76285373b149aee6ea15cac6e15675566f2c0d5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "ff6fe02817f0844c04ab7f49950a4002ddb29aec162412c8dae098ee3d8a27af"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "e8f38ae68a67e5c67b256d0081aa958367b37082454d56d0138a59168a47e20c"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "eb361e567c70bd6019dc7a16f16eaefbc5166fd158586360a70f1fbd445db572"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "102962e7b753737d622bbea4698f0282c64ea1b3b55c3f61e523c8c9378fcd35"
    sha256 cellar: :any_skip_relocation, sonoma:         "311f6423eb40e5ad10433ed343d9e9c656f27fb33daabffcc6f3da7d736247b7"
    sha256 cellar: :any_skip_relocation, ventura:        "c661a59421715b882fce53c1f789b22fa0673d2d5fd6b531f897ecfaa882681e"
    sha256 cellar: :any_skip_relocation, monterey:       "2e3682a73a087bcd527262f35e0dcbc9e40d292b360b36ebf2926ec722385713"
    sha256 cellar: :any_skip_relocation, big_sur:        "d7c353ca381bdfad07569b445ff29fe592979e6623354df939452528ecec76c0"
    sha256 cellar: :any_skip_relocation, catalina:       "ff424f6afbc0d2baab91cee289157d9c90623fa19b7d51574b75df455da76cd6"
    sha256 cellar: :any_skip_relocation, mojave:         "316687b381ca23ee0e81eb6e396d2c8c21a5eeaf05a9219ec56dd0024a8d9722"
    sha256 cellar: :any_skip_relocation, high_sierra:    "bd1b52730bbf5bc503d3fece003b069e248261616d9d02767ef019d87659bdd8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "382e8b0d2644f4eaf1fd5132262dbe66a9c89549b0f38e96254ad37969a2a709"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/wiki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wiki --version")

    assert_match "Read more: https://en.wikipedia.org/wiki/Go", shell_output("#{bin}/wiki golang")
  end
end
