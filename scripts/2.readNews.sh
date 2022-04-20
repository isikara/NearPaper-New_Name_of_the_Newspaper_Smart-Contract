#!/usr/bin/env bash

# exit on first error after this point to avoid redeploying with successful build
set -e

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
