function cleanfile() {
	echo "-- Function Executed --"

	# get extension of file retrieved
	fullfile=$1
	filename="${fullfile##*/}"
	extension=$([[ "$filename" = *.* ]] && echo ".${filename##*.}" || echo '')
	echo $extension

	# checking what type of file it is
	# Swift, Python, Javascript, Bash, Java, Objective C
	echo $filename
	case "$extension" in
    .txt|.pdf )
        echo "text or pdf file, no debugging lines to delete" 
        ;; # breakpoint for bash
	.swift|.py ) # works
		echo "swift file or python file"
		sed -i '' '/print(/d' ./$filename
		echo "deleted"
		;;
	.js ) # works
		echo "javascript file"
		sed -i '' '/console.log(/d' ./$filename
		echo "deleted"
		;;
	.sh ) # works
		echo "terminal script"
		sed -i '' '/echo/d' ./$filename
		echo "deleted"
		;;
	.java ) # works
		echo "java file"
		sed -i '' '/System.out.print/d' ./$filename
		echo "deleted"
		;;
	.h|.m ) # untested
		echo "objective c file"
		sed -i '' '/NSLog(@/d' ./$filename
		sed -i '' '/NSString */d' ./$filename
		sed -i '' '/printf(/d' ./$filename
		echo "deleted"
	esac
		echo "exiting case statement"
}