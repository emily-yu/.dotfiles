# API Removal

APIRemover will prevent accidental exposure of API keys on GitHub by removing API keys before committing your changes, while allowing your API keys in your local files to remain intact. 

### Features:
```
apiremoveall "commit message"
```
This command changes *all* files with API keys in them and commits them to GitHub with the replaced <YOUR-API-KEY> filler text, then returns the original API key to your local file. 

```
apiremovefile filename "commit message"
```
This command is similar to apiremoveall, but the script only applies the changes for one file. 

Example format (OpenWeatherAPI): 
```
var apiKey = "asdf230948902890382308490" 
url = URL(string: String("http://api.openweathermap.org/data/2.5/weather?APPID=\(apiKey)&lat=\(123)&lon=\(123)"))
```
Your API key, "asdf230948902890382308490," would be replaced with `<YOUR-API-KEY>`. The script will scan for this line, so embed this variable into request where you would normally put the API key. 

### Installation: 
As you would install any other terminal script, go to terminal and type the following command: 
```
open ~/.bash_profile
```
This opens the file that will contain all the scripts with the functions that can be run by terminal. On some systems, the file may be called ~/.profile, so if that does not work then try ```open ~/.profile``` instead. 
```
source "<YOUR PATH NAME>"
```
Replace ```<YOUR PATH NAME>``` with the path the file with the script, then restart terminal. The script should then be ready to use.


### Improvements:
* censor more than just API keys
* make syntax less API-oriented (if censoring more than just API keys)
