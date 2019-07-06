if [ $# = 0 ]
then
    for dir_path in $(ls -F | grep "/$") 
    do
        echo "- [${dir_path%/}](${dir_path}index.html)"
    done
elif [ $# = 1 ]
then
    cd $1
    for html_path in $(ls *.html | sort -h)
    do
        [ "$html_path" = 'index.html' ] && continue
        file_name=$(echo $html_path | sed 's$.*/$$;s$\.html$$')
        echo "- [$file_name](${file_name}.html)"
    done
fi