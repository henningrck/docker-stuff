#!/bin/sh

project="paper"
version_group="1.20"
api="https://papermc.io/api/v2"

latest_build="$(curl -sX GET "$api"/projects/"$project"/version_group/"$version_group"/builds -H 'accept: application/json' | jq -r '.builds[-1].build')"
version="$(curl -sX GET "$api"/projects/"$project"/version_group/"$version_group"/builds -H 'accept: application/json' | jq -r '.builds[-1].version')"

download_url="$api"/projects/"$project"/versions/"$version"/builds/"$latest_build"/downloads/"$project"-"$version"-"$latest_build".jar
jar_file="$project"-"$version"-"$latest_build".jar

if [ ! -f "$jar_file" ]
then
    rm *.jar
    curl "$download_url" -o "$jar_file"
fi

if [ ! -f eula.txt ]
then
    echo "eula=true" > eula.txt
fi

java -Xms2G -Xmx2G -jar "$jar_file" --nogui
