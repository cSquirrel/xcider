
# xcode-select: Report or change the path to the active
#               Xcode installation for this machine.
#
# Usage: xcode-select --print-path
#            Prints the path of the active Xcode folder
#    or: xcode-select --switch <xcode_path>
#            Sets the path for the active Xcode folder
#    or: xcode-select --version
#            Prints the version of xcode-select

class Xcider::Xcodeselect

  def initialize
  end

  def version
      return `xcode-select --version`.gsub("\n","; ")
  end

  #def switch(xcode_path)
  #    return `sudo xcode-select --switch #{xcode_path}`
  #end

  def get_path
      return `xcode-select --print-path`
  end

end
