#!/bin/bash

set -e

# cd cdk && cd deploy && cd -
npm install
npm run build
aws s3 sync ./dist s3://typescript.tips --delete
aws cloudfront create-invalidation \
    --distribution-id E3DB5ZJ8DQAN6Z \
    --paths "/*"
