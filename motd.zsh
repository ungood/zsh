function stockquote() {
    curl -s "http://download.finance.yahoo.com/d/quotes.csv?s=$1&f=l1"
}

function motd() {
    echo "AMZN: \$$(stockquote AMZN)\n"
    wu
}
