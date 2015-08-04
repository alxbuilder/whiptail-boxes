function length() {
        expr `echo "$*" |wc -c` - 1 
}

function longest() {
        LONGEST=0
        for STRING in $*
        do  
                THISLEN=`length $STRING`
                [ $THISLEN -gt $LONGEST ] && \
                        LONGEST=$THISLEN
        done
        echo $LONGEST
}

function snake_case() {
        echo $* |sed -e s/\ /_/g
}

function rows() {
        echo `tput cols`
}

function columns() {
        echo `tput lines`
}

function max_width() {
        echo `rows - 6` # whiptail boxes use 3 chars before & after text
}

function screen_size() {
        ROWS=`tput cols` && COLS=`tput lines` && RESULT="${ROWS}x${COLS}"
        echo $RESULT
}

function too_long() {
        [ `length $*` -gt `max_width` ]
}

function shorten() {
        echo $* |cut -c1-$(expr `rows` - 6)
}

function too_long_for_box() {
		[ `too_long "$*"` ] && echo `shorten $TITLE`
}
