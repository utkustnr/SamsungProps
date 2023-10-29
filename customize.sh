# Print head message
ui_print "- Installing SamsungProps"

# Remove comments from files and place them, add blank line to end if not already present
# Scripts
for i in $(find "$MODPATH" -type f -name "*.sh" -o -name "*.prop" -o -name "*.rule"); do
  [ -f "$i" ] && {
    sed -i -e "/^#/d" -e "/^ *$/d" "$i"
    [ "$(tail -1 "$i")" ] && echo "" >>"$i"
  } || continue
done

# Print footer message
ui_print "- Script by Tesla, Telegram: @T3SL4. Modified by @Simon1511."
