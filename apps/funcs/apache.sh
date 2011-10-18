# Apache Utility Functions
# ========================
# 
#     by: Ben, untar.org
#     in: utils, apache
#


isapacherunning_doc='Is apache running?'
isapacherunning () {
	ap=apache2
	ps -eaf | grep "$ap" | grep -v grep
}

