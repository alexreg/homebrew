require "formula"

class JackSmfUtils < Formula
  homepage "http://sourceforge.net/projects/jack-smf-utils/"
  url "https://downloads.sourceforge.net/project/jack-smf-utils/jack-smf-utils/1.0/jack-smf-utils-1.0.tar.gz"
  sha1 "88533da65c3f6872b0a690f30da7f5ca635cfe59"

  head "svn://svn.code.sf.net/p/jack-smf-utils/code/trunk"

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on JackDependency
  depends_on "libsmf"

  option :universal

  def install
    ENV.universal_binary if build.universal?

    ENV.refurbish_args

    if !build.stable?
      system "autoreconf -i"
    end
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "jack-smf-player", "-V"
    system "jack-smf-recorder", "-V"
  end
end
