#!/usr/bin/env bash
source ./lib/selenium.sh
chromedriver &
sleep 1

main() {
    # Open the page.
    navigate_to 'https://www.google.com'

    # get the element of the search box.
    local searchBox=$(find_element 'name' 'q')

    # Input to the search box and enter.
    send_keys $searchBox "python\n"

    # close the session
    delete_session
}

main
