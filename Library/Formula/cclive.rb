require 'formula'

class Cclive < Formula
  homepage 'http://cclive.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/cclive/0.7/cclive-0.7.16.tar.xz'
  sha1 '2bdee70f5e2026165ca444a306bb76fc5ede97b4'

  devel do
    url 'http://downloads.sourceforge.net/project/cclive/0.9/cclive-0.9.3.tar.xz'
    sha1 'bdcc87b3f03ed24dfe39a06159b565df7fdce875'
  end

  head 'https://github.com/legatvs/cclive.git'

  conflicts_with 'clozure-cl', :because => 'both install a ccl binary'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'quvi'
  depends_on 'boost'
  depends_on 'pcre'
  if build.devel?
    depends_on 'glibmm' => :build
    depends_on 'glib' => :build
    depends_on 'libsigc++' => :build
  end

  # OLD FORMULA: https://github.com/Homebrew/homebrew/pull/22276/files

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
