# seclib - security related functions
# ====================================
#
#     by: ben, untar.org
#     in: utils, security, gpg, ssh



die(){ echo >&2 "$@"; exit 1; }
usage(){ die "Usage: $1" ; }


gpglist_doc='list the keys in the private key ring'
gpglist(){ 
    [ "$#" = 0 ]  &&   usage  'gpglist [public|private]'
    case "$1" in
        public) gpg --list-keys ;;
        private) gpg --list-secret-keys;;
        *) usage "Error";;
    esac
}
    
