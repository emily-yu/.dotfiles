# alias myip='curl ip.appspot.com'

#invoke: noapi "commit message"
#changes all variables named apiKey in repository to <YOUR-API-KEY>
function noapi() {
	valuetbh="$(grep apiKey * -lR)"
	echo $valuetbh

	vars=( $valuetbh )
	echo "First  word of var: '${vars[0]}'" # '${vars[0]}' is the first file
	echo "Second word of var: '${vars[1]}'" # '${vars[1]}' is the second file
	echo "Number of words in var: '${#vars[@]}'" #'${#vars[@]}' is the number of files
	for (( c=0; c<${#vars[@]}; c++ )) #loops number of files time
	do  
	   echo "Welcome $c times"
	   #add shit from apiremove function
	   echo $(cd $(dirname "${vars[c]}") && pwd -P)/$(basename "${vars[c]}")
	   # filepath="$(cd $(dirname "${vars[c]}") && pwd -P)/$(basename "${vars[c]}")"
	   apiremove $(cd $(dirname "${vars[c]}") && pwd -P)/$(basename "${vars[c]}") $1
	done

	#add: 

	#on main function, add if the thing is blank (the reference) doesn't exist - then git add. 
	#if it exists, use git add filename

	#don't commit all the -e-e-e-e-e-e-ee-e-e files
}

#commits a version to local git with <YOUR-API-KEY>
function apiremove() { #$1 takes first parameter, $2 takes second parameter, etc. 
	#retrieve variable of apiKey
	read apiKey < $1
	IFS=’=’ 
	read -ra apiKey <<< "$apiKey" 
	NO_WHITESPACE="$(echo -e "${apiKey[1]}" | tr -d '[:space:]')"
	echo -e "${NO_WHITESPACE}" #echo value of apiKey variable

	#replace api, commit it, and replace it with original api variable again
	temp=${NO_WHITESPACE}  #sets temp to original api key variable 
	echo $temp
	sed -i -e "s/$temp/'<YOUR-API-KEY>'/g" $1 #changes value of first to second
	git add $1 #git add w/ replaced key - UNTESTED
    git commit -m $2 #git add with message
    sed -i -e "s/'<YOUR-API-KEY>'/$temp/g" $1 #put the api key variable back in local repo
}
