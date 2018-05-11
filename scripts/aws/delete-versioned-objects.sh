#!/bin/bash
aws s3api delete-objects --bucket <bucket-name> --delete "$(aws s3api list-object-versions --bucket <bucket-name> | jq '{Objects: [.Versions[] | {Key:.Key, VersionId : .VersionId}], Quiet: false}')"
