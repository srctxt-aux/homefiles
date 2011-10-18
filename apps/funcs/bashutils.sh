# Bash util functions
#
#     by: Ben, untar.org
#     in: utils, bash
#



hitparade_doc='Show  the most used tools'
hitparade () {
 hist=$(history)
 echo "$hist" | awk '{print $2}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -n | tail | sort -nr
}
