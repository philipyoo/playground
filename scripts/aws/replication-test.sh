#!/usr/bin/env bash
# Non-configurable ports & profiles
# Arg1 === Bucket1
# Arg2 === Bucket2

NC='\033[0m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

ONE=$1
TWO=$2

fail() {
    echo -e "${RED}${1}${NC}\n"
    exit 1
}

echo -e "\n${RED}STARTING CHECK${NC}"
echo -e "====="

echo -e "${BLUE}Do buckets exist?${NC}"
aws s3api head-bucket --endpoint http://localhost:8000 --profile backbeat-source --bucket $ONE &>/dev/null
if [[ $? -ne 0 ]]; then
    fail "Bucket ${ONE} does not exist."
fi

aws s3api head-bucket --endpoint http://localhost:8100 --profile backbeat-target --bucket $TWO &>/dev/null
if [[ $? -ne 0 ]]; then
    fail "Bucket ${TWO} does not exist."
fi

echo -e "\n${YELLOW}Both Buckets exist.${NC}"
echo -e "====="
echo -e "${BLUE}Is versioning enabled?${NC}"

aws s3api get-bucket-versioning --endpoint http://localhost:8000 --profile backbeat-source --bucket $ONE &>/dev/null
if [[ $? -ne 0 ]]; then
    fail "Bucket ${ONE} Versioning not enabled."
fi

aws s3api get-bucket-versioning --endpoint http://localhost:8100 --profile backbeat-target --bucket $TWO &>/dev/null
if [[ $? -ne 0 ]]; then
    fail "Bucket ${TWO} Versioning not enabled."
fi

echo -e "\n${YELLOW}Both Buckets have versioning enabled.${NC}"
echo -e "====="
echo -e "${BLUE}Is replication enabled?${NC}"

aws s3api get-bucket-replication --endpoint http://localhost:8000 --profile backbeat-source --bucket $ONE &>/dev/null
if [[ $? -ne 0 ]]; then
    fail "Bucket Replication not enabled."
fi

echo -e "\n${YELLOW}Bucket replication enabled.${NC}"
echo -e "====="
echo -e "${GREEN}Done testing and looks like everything is all setup correctly.${NC}\n"
