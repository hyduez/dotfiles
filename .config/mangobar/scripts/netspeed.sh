#!/bin/sh
iface=$(ip route show default 2>/dev/null | awk '{print $5; exit}')
if [ -z "$iface" ] || [ ! -r "/sys/class/net/$iface/statistics/rx_bytes" ]; then
    echo "disconnected"
    exit 0
fi
rx=$(cat "/sys/class/net/$iface/statistics/rx_bytes")
tx=$(cat "/sys/class/net/$iface/statistics/tx_bytes")
cache="/tmp/mangobar-netspeed-$iface"
now=$(date +%s)
human() {
    b=$1
    if [ "$b" -ge 1048576 ]; then
        awk "BEGIN{printf \"%.1fM\", $b/1048576}"
    elif [ "$b" -ge 1024 ]; then
        awk "BEGIN{printf \"%.0fK\", $b/1024}"
    else
        printf "%dB" "$b"
    fi
}
if [ -f "$cache" ]; then
    # shellcheck disable=SC2162
    read prx ptx pnow < "$cache" 2>/dev/null
    dt=$((now - pnow)); [ "$dt" -lt 1 ] && dt=1
    drx=$(( (rx - prx) / dt )); dtx=$(( (tx - ptx) / dt ))
    [ "$drx" -lt 0 ] && drx=0; [ "$dtx" -lt 0 ] && dtx=0
    echo "↓ $(human "$drx") ↑ $(human "$dtx")"
else
    echo "↓ 0B ↑ 0B"
fi
echo "$rx $tx $now" > "$cache"
