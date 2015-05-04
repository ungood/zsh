function stockquote() {
    curl -s "http://download.finance.yahoo.com/d/quotes.csv?s=$1&f=l1"
}

function motd() {
    echo "AMZN: \$$(stockquote AMZN)\n"
    wu
}

function recursive_cow() {
    out=$(cowsay $1)
    for i in {1..$2}; do
        out=`echo $out | cowsay -n`
    done
    echo $out
}
