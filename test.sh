#!/usr/bin/env bash

# start chromedriver(これでもchromedriver立ち上がる)
chromedriver &
sleep 1

main() {
    # Googleのトップページに遷移
    navigate_to 'https://google.co.jp'

    # 検索ボックスの要素を取得
    local searchBox=$(find_element 'name' 'q')

    # 検索ボックスに入力＆検索実行
    send_keys $searchBox "タピオカ\n"
}

#curl:  -H (:request header)
#       'Content-Type: application/json' (:送信するデータがJSON形式であることを明示)
#       -d (データ)
get_session_id() {
    curl -s -X POST -H 'Content-Type: application/json' \
        -d '{
            "desiredCapabilities": {
                "browserName": "chrome"
            }
        }' \
        ${ROOT}/session | jq -r '.sessionId'
}

ROOT=http://localhost:9515
SESSION_ID=$(get_session_id)
BASE_URL=${ROOT}/session/${SESSION_ID}


navigate_to() {
    local url=$1
    curl -s -X POST -H 'Content-Type: application/json' -d '{"url":"'${url}'"}' ${BASE_URL}/url
}

find_element() {
    local property=$1
    local value=$2
    curl -s -X POST -H 'Content-Type: application/json' \
    -d '{"using":"'$property'", "value": "'$value'"}' ${BASE_URL}/element | jq -r '.value.ELEMENT'
}

send_keys() {
    local elementId=$1
    local value=$2
    curl -s -X POST -H 'Content-Type: application/json' \
    -d '{"value": ["'$value'"]}' ${BASE_URL}/element/${elementId}/value >/dev/null
}

main