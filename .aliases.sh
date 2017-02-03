#invoke: apiremoveall "commit message"
#changes all variables named apiKey in repository to <YOUR-API-KEY> and commits them all
function apiremoveall() {
	valuetbh="$(grep apiKey * -lR)"
	echo $valuetbh
	vars=( $valuetbh )
	echo "First  word of var: '${vars[0]}'" # '${vars[0]}' is the first file
	echo "Second word of var: '${vars[1]}'" # '${vars[1]}' is the second file
	echo "Number of words in var: '${#vars[@]}'" #'${#vars[@]}' is the number of files
	for (( c=0; c<${#vars[@]}; c++ )) #loops number of files time
	do  
	   echo "Welcome $c times"
	   echo $(cd $(dirname "${vars[c]}") && pwd -P)/$(basename "${vars[c]}")
	   # filepath="$(cd $(dirname "${vars[c]}") && pwd -P)/$(basename "${vars[c]}")"
	   apiremovefile $(cd $(dirname "${vars[c]}") && pwd -P)/$(basename "${vars[c]}") $1
	done
}

#invoke: apiremovefile filename "commit message"
#use for single commits
#commits a version to local git with <YOUR-API-KEY>
function apiremovefile() { #$1 takes first parameter, $2 takes second parameter, etc. 

	key="$(getvariable $1)" #sets temp to original api key variable 

	#replace api, commit it, and replace it with original api variable again
	echo $key
	sed -i '' "s/$key/<YOUR-API-KEY>/g" $1 #replace key w/ <YOUR-API-KEY>
	git add $1 #git add w/ replaced key
	git commit -m $2 #git add with message
	sed -i '' "s/<YOUR-API-KEY>/$key/g" $1 #replace <YOUR-API-KEY> w/ original key
}

#gets the api key as long as it is between double quotes
#var apiKey = "asdfasdfasdfasfasdfdas"
function getvariable() { 
	teststring=$(grep -E 'var apiKey' $1)
	echo $teststring | cut -d '"' -f2 | cut -d '"' -f1 #can use different cases for different language accomodation?
}