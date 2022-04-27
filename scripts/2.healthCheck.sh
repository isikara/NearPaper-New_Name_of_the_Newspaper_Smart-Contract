#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable"
[ -z "$YOUR_ACC" ] && echo "Missing \$YOUR_ACC environment variable"

[ -z "$CONTRACT" ] && echo Please \export your account id to the \$CONTRACT variable!
[ -z "$CONTRACT" ] && echo 'export CONTRACT=__new_contract_account_id__'

[ -z "$YOUR_ACC" ] echo Please \export your account id to the \$YOUR_ACC variable!
[ -z "$YOUR_ACC" ] echo 'export YOUR_ACC="YOUR ACCOUNT NAME'

echo ---------------------------------------------------------
echo "Step 1: Call 'call' functions on the contract"
echo ---------------------------------------------------------
echo 
echo "near call $CONTRACT healthCheck '{"req" : "<Your-Key>","rep" : "<Your-Value>"}' --accountId $YOUR_ACC"
echo 

echo
exit 0
