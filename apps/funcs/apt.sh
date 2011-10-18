
apti_doc='An alias for: sudo apt-get install'
apti_arg='<pattern>'
apti(){
    pat="$1"
    sudo apt-get install "$pat"
}

aptl_doc='Show installed packages'
aptl_arg='<pattern>'
aptl(){
    pat="$1"
    dpkg --get-selections | awk '{ print $1 }' | grep "$pat"
}
