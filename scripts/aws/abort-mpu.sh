#!/bin/bash

BUCKET=$1

aws s3api list-multipart-uploads --bucket $BUCKET --endpoint http://localhost --profile src \
| jq -r '.Uploads[] | "--key \"\(.Key)\" --upload-id \(.UploadId)"' \
| while read -r line; do
    eval "aws s3api abort-multipart-upload --endpoint http://localhost --profile src --bucket $BUCKET $line";
done
