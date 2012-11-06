
# Usage: xcodebuild [-project <projectname>] [[-target <targetname>]...|-alltargets] [-configuration <configurationname>] [-arch <architecture>]... [-sdk [<sdkname>|<sdkpath>]] [-showBuildSettings] [<buildsetting>=<value>]... [<buildaction>]...
#       xcodebuild [-project <projectname>] -scheme <schemeName> [-configuration <configurationname>] [-arch <architecture>]... [-sdk [<sdkname>|<sdkpath>]] [-showBuildSettings] [<buildsetting>=<value>]... [<buildaction>]...
#       xcodebuild -workspace <workspacename> -scheme <schemeName> [-configuration <configurationname>] [-arch <architecture>]... [-sdk [<sdkname>|<sdkpath>]] [-showBuildSettings] [<buildsetting>=<value>]... [<buildaction>]...
#       xcodebuild -version [-sdk [<sdkfullpath>|<sdkname>] [<infoitem>] ]
#       xcodebuild -list [[-project <projectname>]|[-workspace <workspacename>]]
#       xcodebuild -showsdks
#Options:
#    -usage                  print brief usage
#    -help                   print complete usage
#    -verbose                provide additional status output
#    -license                Show License agreement!
#    -project NAME           build the project NAME
#    -target NAME            build the target NAME
#    -alltargets             build all targets
#    -workspace NAME         build the workspace NAME
#    -scheme NAME            build the scheme NAME
#    -configuration NAME     use the build configuration NAME for building each target
#    -xcconfig PATH          apply the build settings defined in the file at PATH as overrides
#    -arch ARCH              build each target for the architecture ARCH; this will override architectures defined in the project
#    -sdk SDK                use SDK as the name or path of the base SDK when building the project
#    -toolchain NAME         use the toolchain with identifier or name NAME
#    -parallelizeTargets     build independent targets in parallel
#    -jobs NUMBER            specify the maximum number of concurrent build operations
#    -dry-run                do everything except actually running the commands
#    -showsdks               display a compact list of the installed SDKs
#    -showBuildSettings      display a list of build settings and values
#    -list                   lists the targets and configurations in a project, or the schemes in a workspace
#    -find-executable NAME   display the full path to executable NAME in the provided SDK and toolchain
#    -find-library NAME      display the full path to library NAME in the provided SDK and toolchain
#    -version                display the version of Xcode; with -sdk will display info about one or all installed SDKs

module Xcider
  class Xcodebuild

    attr_accessor :workspace
    attr_accessor :scheme
    attr_accessor :configuration
    attr_accessor :arch
    attr_accessor :sdk
    attr_accessor :dry_run
    attr_accessor :last_command_string

    def initialize

      self.workspace=nil
      self.scheme=nil
      self.configuration=nil
      self.arch=nil
      self.sdk=nil

    end

    def version

      return `xcodebuild -version`.gsub("\n","; ")

    end

    def build

      build_params=%w"workspace scheme configuration arch sdk"
      build_switches=%w"dry_run"

      opts=[]
      build_switches.each do |attr|
        value=self.send("#{attr}")
        switch_name=attr.gsub("_","-")
        opts << "-#{switch_name}" if value
      end
      build_params.each do |attr|
        value=self.send("#{attr}")
        opts << "-#{attr} \"#{value}\"" if value
      end
      opts_str=opts.join(" ")

      self.last_command_string="xcodebuild #{opts_str}"

    end

    def self.cleanup

      #puts "Cleanup Xcode project"
      builder=Xcodebuild.new
      #puts builder.version

      select=Xcodeselect.new
      #select.switch "/tmp"
      #puts "Path: #{select.get_path}"

    end
  end
end