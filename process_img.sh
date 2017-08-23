#!/bin/bash

max_size=3072

[ ! -f bilder/.processed ] && touch -d "1970-01-01 00:00:00" bilder/.processed

find bilder -newer bilder/.processed -and "(" -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.png" ")" | while read img; do
	echo "Inspecting ${img} ..."
	info=$(exiv2 -q "${img}" 2>/dev/null)
	err=$?
	size=($(echo ${info} | sed -n 's/.*Image size : \([0-9]*\) x \([0-9]*\).*/\1 \2/p' 2>/dev/null))
	#echo ${size[0]} ${size[1]}
	if [[ ${err} -eq 0 || ${size[0]} -gt ${max_size} || ${size[1]} -gt ${max_size} ]]; then
		bak="${img}-backup"
		if [ ! -f "${bak}" ]; then
			echo "  Making backup"
			cp "${img}" "${bak}"
		fi
		if [[ ${err} -eq 0 ]]; then
			echo "  Removing metadata"
			exiv2 rm "${img}"
		fi
		if [[ ${size[0]} -gt ${max_size} || ${size[1]} -gt ${max_size} ]]; then
			echo "  Resizing"
			convert -resize ${max_size}x${max_size} "${img}" "${img}"
		fi
	fi
done

touch bilder/.processed

