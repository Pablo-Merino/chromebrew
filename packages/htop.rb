require 'package'                                                 # include package class file
 
class Vim < Package                                               # name the package and make it a Package class instance
  version '1.0.2'                                                   # software version
  source_url 'http://downloads.sourceforge.net/project/htop/htop/1.0.2/htop-1.0.2.tar.gz?r=&ts=1380451135&use_mirror=surfnet'     # software source tarball url
  source_sha1 '07893b93fe8109610f8e9976b3934ae4bb7a925d'          # source tarball sha1 sum
  
  depends_on 'ncurses'                                            # software dependencies
  
  def self.build                                                  # self.build contains commands needed to build the software from source
    system "make"                                                 # ordered chronologically
  end
  
  def self.install                                                # self.install contains commands needed to install the software on the target system
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"          # remember to include DESTDIR set to CREW_DEST_DIR - needed to keep track of changes made to system
  end                                                             # during installation
end