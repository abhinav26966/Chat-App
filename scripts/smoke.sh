#!/usr/bin/env bash
set -euo pipefail

URL=${URL:-http://localhost:4040}
body="{\"username\":\"smoke$RANDOM\",\"password\":\"smoke-pass\"}"

ready=$(curl -sf --retry 10 --retry-connrefused --retry-delay 2 $URL/readyz)
echo "$ready"
[[ -z "${TAG:-}" || "$ready" == *"\"version\":\"$TAG\""* ]]

curl -sf -X POST $URL/register -H 'Content-Type: application/json' -d "$body" >/dev/null
headers=$(curl -sfi -X POST $URL/login -H 'Content-Type: application/json' -d "$body")
token=$(echo "$headers" | grep -i '^set-cookie: token=' | sed 's/.*token=\([^;]*\).*/\1/')
curl -sf $URL/profile -H "Cookie: token=$token" >/dev/null
[ "$(curl -s -o /dev/null -w '%{http_code}' $URL/messages/x)" = 401 ]

echo "smoke test ok"
