# port.fish
# Completions for MacPorts
# by Brigham Toskin <brigham@acm.org>
# Based on the form of emerge.fish by Tassilo Horn <tassilo@member.fsf.org>
# and apt-get.fish (no author stated).


#########################
# Util Functions

function __fish_port_no_action --description 'Test if port has yet to be given an action'
        for i in (commandline -opc)
            if contains -- $i search info variants deps dependents install uninstall activate deactivate installed location contents provides sync outdated upgrade clean echo list mirror version platform selfupdate load unload gohome usage help dir work cd file url cat edit unarchive fetch checksum extract patch configure build destroot test lint archive distcheck distfiles livecheck pkg mpkg dmg mdmg rpm srpm dpkg
		return 1
            end
        end
        return 0 # true in shell land
end

function __fish_port_print_installed_pkgs --description 'Prints completions for installed packages on the system'
	set -l cmd 'for i in active inactive installed outdated obsolete; echo $i; end'
	cat (port installed ^/dev/null | awk '{print $1}'|psub) (eval $cmd|psub) | tr '[A-Z]' '[a-z]' | sort ^/dev/null
	return
end

function __fish_port_print_all_pkgs --description 'Prints completions for all available packages'
	set -l cmd 'for i in all current active inactive installed uninstalled outdated obsolete; echo $i; end'
	cat (port echo all ^/dev/null|psub) (eval $cmd|psub) | tr '[A-Z]' '[a-z]' | sort | sed 's/ *$//g'
	return
end

function __fish_port_use_installed_package --description 'Tests if port command should have an installed package (but not non-installed ones) as potential completion'
  if __fish_port_no_action
     return 1
  end
  for i in (commandline -opc)
    if contains -- $i upgrade uninstall activate deactivate provides load unload
      return 0 #true, in shell land
    end
  end
  return 1
end

function __fish_port_use_package --description 'Test if port command should have all known packages as potential completion'
	 if __fish_port_no_action
	    return 1
	 end
        for i in (commandline -opc)
            if contains -- $i search info variants deps dependents install installed clean echo list mirror gohome dir work cd file url cat edit unarchive fetch checksum extract patch configure build destroot test lint archive distcheck distfiles livecheck pkg mpkg dmg mdmg rpm srpm dpkg
                        return 0
                end
        end
        return 1
end

#########################
# Action completions

# package completions, based on specified action
complete -c port -n '__fish_port_use_installed_package' -xua '(__fish_port_print_installed_pkgs ^/dev/null)' -d 'Installed Package' #'(_ "Package")'
complete -c port -n '__fish_port_use_package' -xua '(__fish_port_print_all_pkgs ^/dev/null)' -d 'Package' #'(_ "Package")'

complete -c port -n '__fish_port_no_action' -Aa sync -d "Synchronize the ports tree"
complete -c port -n '__fish_port_no_action' -Aa selfupdate -d "Synchronize the ports tree and update port executable"
complete -c port -n '__fish_port_no_action' -Aa info -d "Get detailed package info"
complete -c port -n '__fish_port_no_action' -Aa echo -d "Display info for indicated port(s)"
complete -c port -n '__fish_port_no_action' -Aa version  -d "Displays the port infrastructure version number"
complete -c port -n '__fish_port_no_action' -Aa help -d "Displays help information for MacPorts"
complete -c port -n '__fish_port_no_action' -Aa clean -d "Clean build dir of specified port(s)"
complete -c port -n '__fish_port_no_action' -Aa search -d "Search for matches in the ports tree"
complete -c port -n '__fish_port_no_action' -Aa install -d "Install a package"
complete -c port -n '__fish_port_no_action' -Aa uninstall -d "WARNING: Remove the given package"
complete -c port -n '__fish_port_no_action' -Aa upgrade -d "Upgrade package to latest version"

#########################
# Option completions
# TODO: translate this to MacPorts or delete it
#complete -c emerge -l alphabetical -d "Sort flag lists alphabetically"
#complete -c emerge -s a -l ask -d "Prompt the user before peforming the merge"
#complete -c emerge -s b -l buildpkg -d "Build a binary package additionally"
#complete -c emerge -s B -l buildpkgonly -d "Only build a binary package"
#complete -c emerge -s l -l changelog -d "Show changelog of package. Use with --pretend"
#complete -c emerge -l color -xa 'y\t"'(_ "Use colors in output")'" n\t"'(_ "Don't use colors in output")'"' -d "Toggle colorized output"
#complete -c emerge -l colums -d "Align output. Use with --pretend"
#complete -c emerge -s d -l debug -d "Run in debug mode"
#complete -c emerge -s D -l deep -d "Consider the whole dependency tree"
#complete -c emerge -s e -l emptytree -d "Reinstall all world packages"
#complete -c emerge -s f -l fetchonly -d "Only download the packages but don't install them"
#complete -c emerge -s F -l fetch-all-uri -d "Same as --fetchonly and grab all potential files"
#complete -c emerge -s g -l getbinpkg -d "Download infos from each binary package. Implies -k"
#complete -c emerge -s G -l getbinpkgonly -d "As -g but don't use local infos"
#complete -c emerge -l ignore-default-opts -d "Ignore EMERGE_DEFAULT_OPTS"
#complete -c emerge -s N -l newuse -d "Include installed packages with changed USE flags"
#complete -c emerge -l noconfmem -d "Disregard merge records"
#complete -c emerge -s O -l nodeps -d "Don't merge dependencies"
#complete -c emerge -s n -l noreplace -d "Skip already installed packages"
#complete -c emerge -l nospinner -d "Disable the spinner"
#complete -c emerge -s 1 -l oneshot -d "Don't add packages to world"
#complete -c emerge -s o -l onlydeps -d "Only merge dependencies"
#complete -c emerge -s p -l pretend -d "Display what would be done without doing it"
#complete -c emerge -s q -l quit -d "Use a condensed output"
#complete -c emerge -l skipfirst -d "Remove the first package in the resume list. Use with --resume"
#complete -c emerge -s t -l tree -d "Show the dependency tree"
#complete -c emerge -s k -l usepkg -d "Use binary package if available"
#complete -c emerge -s K -l usepkgonly -d "Only use binary packages"
#complete -c emerge -s v -l verbose -d "Run  in  verbose  mode"
#complete -c emerge -l with-bdeps -xa 'y\t"'(_ "Pull in build time dependencies")'" n\t"'(_ "Don't pull in build time dependencies")'"' -d "Toggle build time dependencies"