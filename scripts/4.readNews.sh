#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable"
[ -z "$CONTRACT" ] && echo Please \export your account id to the \$CONTRACT variable!
[ -z "$CONTRACT" ] && echo 'export CONTRACT=__new_contract_account_id__'

echo
echo
echo ---------------------------------------------------------
echo "Step 1: Call 'view' functions on the contract"
echo
echo "near view $CONTRACT readNews"
echo ---------------------------------------------------------
echo

near view $CONTRACT readNews

echo
exit 0
