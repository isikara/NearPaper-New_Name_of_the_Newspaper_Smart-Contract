#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable"
[ -z "$YOUR_ACC" ] && echo "Missing \$YOUR_ACC environment variable"
[ -z "$ID" ] && echo "Missing \$ID environment variable"

[ -z "$CONTRACT" ] && echo Please \export your account id to the \$CONTRACT variable!
[ -z "$CONTRACT" ] && echo 'export CONTRACT=__new_contract_account_id__'

[ -z "$YOUR_ACC" ] echo Please \export your account id to the \$YOUR_ACC variable!
[ -z "$YOUR_ACC" ] echo 'export YOUR_ACC=__your_account_name__'

[ -z "$ID" ] echo Please \export the id of the news to the \$ID variable!
[ -z "$ID" ] echo 'export ID=__id_of_the_news__'

echo ---------------------------------------------------------
echo "Step 1: Call 'bringNews' functions on the contract"
echo ---------------------------------------------------------
echo "After all variables are exported, please use below function. 
echo "near view $CONTRACT bringNews '{"id" : $ID}'"
echo 
echo
exit 0
