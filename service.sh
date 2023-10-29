# Fake encryption state once booted

encrypted=$(getprop ro.crypto.state)
booted=$(getprop sys.boot_completed)

if [ "$encrypted" != "encrypted" ]; then
        while [ "$booted" != "1" ]; do
                sleep 1
                booted=$(getprop sys.boot_completed)
        done

        resetprop "ro.crypto.state" "encrypted"
        resetprop "ro.crypto.type" "file"
fi

