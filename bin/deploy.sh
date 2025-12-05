#!/bin/bash

set -e

# cd cdk && cd deploy && cd -
npm install
npm run build
aws s3 sync ./dist s3://typescript.odone.me --delete
aws cloudfront create-invalidation \
    --distribution-id E1PLVACME4C5G7 \
    --paths "/*"
