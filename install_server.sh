#!/bin/sh

pwd="$PWD"

if [ -f "$pwd/slib.sh" ]; then
    chmod +x "$pwd/slib.sh"
    # shellcheck disable=SC1091
    . "$pwd/slib.sh"
  # Download the slib (source: http://github.com/virtualmin/slib)
  else
    # We need HTTP client first
    pre_check_http_client
    $download "https://$upgrade_virtualmin_host_lib/slib.sh" >>"$log" 2>&1
    if [ $? -ne 0 ]; then
      echo "Error: Failed to download utility function library. Cannot continue. Check your network connection and DNS settings, and verify that your system's time is accurately synchronized."
      exit 1
    fi
    chmod +x slib.sh
    # shellcheck disable=SC1091
    . ./slib.sh
  fi