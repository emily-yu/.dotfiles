# login yourpassword
function login() {
	cd
	cd /usr/local/mysql/bin
	./mysql -u root -p$1
}

# output eyu_assignment1 WITHOUT EXTENSION
# function output() {
# 	cd
# 	source ./mysql-userdefaults.txt
# 	echo $week/$1
# 	echo $mysqlpassword
# 	# login $mysqlpassword
# 	cd /usr/local/mysql/bin
# 	# ./mysql -u root -p$mysqlpassword -e "tee $week/$1.txt source $week/$1.sql"
# 	./mysql -u root -p$mysqlpassword << MY_QUERY
# 		tee $week/$1.txt
# 		source $week/$1.sql
# 		# SQL_QUERY N
# 		exit
# 	MY_QUERY
# }

# defpath rootfolder mysqlpassword
# function defpath() {
# 	if [ ! -f /usr/local/mysql/bin/mysql-userdefaults.txt ]; then
#     	echo "file not found"
# 		cd
# 		echo week=$1 > mysql-userdefaults.txt
# 		echo mysqlpassword=$2 >> mysql-userdefaults.txt
# 	fi
# }