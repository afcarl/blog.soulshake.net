#!/bin/sh

#HUGO_THEME

# (set to any value to enable watching)
HUGO_WATCH=true

# (in seconds, only applies if not watching, if not set, the container will build once and exit)
#HUGO_REFRESH_TIME=10

HUGO_BASEURL="${HUGO_BLOG_URL:=blog.soulshake.net}"

WATCH="${HUGO_WATCH:=false}"
SLEEP="${HUGO_REFRESH_TIME:=-1}"
echo "HUGO_WATCH:" $WATCH
echo "HUGO_REFRESH_TIME:" $HUGO_REFRESH_TIME
echo "HUGO_THEME:" $HUGO_THEME
echo "HUGO_BASEURL:" $HUGO_BASEURL

HUGO=/usr/bin/hugo

echo $HUGO --verbose --source="/src" --theme="$HUGO_THEME" --destination="/output" --baseUrl="$HUGO_BASEURL"
$HUGO --verbose --source="/src" --theme="$HUGO_THEME" --destination="/output" --baseUrl="$HUGO_BASEURL"


$HUGO --verbose server --watch=true --source="/src" --theme="$HUGO_THEME" --destination="/output" --baseUrl="$HUGO_BASEURL" --bind=0.0.0.0 --port=80

#while true
#do
    #if [[ $HUGO_WATCH != 'false' ]]; then
        #echo "Watching..."
        #$HUGO --verbose server --watch=true --source="/src" --theme="$HUGO_THEME" --destination="/output" --baseUrl="$HUGO_BASEURL" --bind=0.0.0.0 || exit 1
    #else
        #echo "Building one time..."
        #$HUGO --verbose --source="/src" --theme="$HUGO_THEME" --destination="/output" --baseUrl="$HUGO_BASEURL" || exit 1
    #fi
#
    #if [[ $HUGO_REFRESH_TIME == -1 ]]; then
        #exit 0
    #fi
    #echo "Sleeping for $HUGO_REFRESH_TIME seconds..."
    #sleep $SLEEP
#done