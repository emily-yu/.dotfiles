function gosetup() {
	echo -e "\n" >> ~/.bash_profile
	echo -e "export GOPATH=$PWD/go-directory" >> ~/.bash_profile
	echo -e "export GOROOT=/usr/local/opt/go/libexec" >> ~/.bash_profile
	echo -e "export PATH=$PATH:$GOPATH/bin" >> ~/.bash_profile
	echo -e "export PATH=$PATH:$GOROOT/bin" >> ~/.bash_profile

	mkdir go-directory
	cd go-directory
	mkdir bin
	mkdir src
	mkdir pkg

	# hello world file
	cd src
	touch hello.go
	echo -e "package main\nimport "fmt"\nfunc main() {\nfmt.Println("hello world")\n}\n" >> hello.go
	cd ..
	cd ..

	echo "Finished setting Go up!"
	echo "Try it out by running:"
	echo "----------------------"
	echo "cd src"
	echo "go run hello.go"

	open ~/.bash_profile
}
