# API Removal
Preventing accidental exposure of API keys on GitHub by removing API keys while committing your changes. 

The following changes all files with API keys in them and commits them to GitHub with the replaced <YOUR-API-KEY> filler text, then returns the original API key to your local file. 
```
apiremoveall "commit message"
```

The following is similar to apiremoveall, but for one file. 
```
apiremovefile filename "commit message"
```

In file example format (OpenWeatherAPI): 
```
var apiKey = "asdf" // replaced with YOUR-API-KEY, script will scan for this line, so embed this variable into GET request
url = URL(string: String("http://api.openweathermap.org/data/2.5/weather?APPID=\(apiKey)&lat=\(123)&lon=\(123)"))
```
