# alias myip='curl ip.appspot.com'

#invoke: apiremove filepath/filepath/filepath "message"
#works for commiting and pushign one file


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
	git push #add to github
	sed -i -e "s/'<YOUR-API-KEY>'/$temp/g" $1 #put the api key variable back in local repo
}
