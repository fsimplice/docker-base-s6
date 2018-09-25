#!/usr/bin/env bash

echo "Checking gitlab vars"
EXPECTED_VARS=(
    PRIVATE_KEY
    GITHUB_REPOSITORY
)

MISSING_VARS=()

for expected_var in "${EXPECTED_VARS[@]}"
do
    if [ -z "${!expected_var}" ]
    then
        MISSING_VARS+=(${expected_var})
    fi
done

if [ "${#MISSING_VARS[@]}" -gt 0 ]
then
    for missing_var in "${MISSING_VARS[@]}"
    do
        echo "Missing GitLab secret variable ${missing_var} (Settings > CI/CD Pipelines > Secret Variables)"
    done
    exit 1
else
    echo "All expected vars found !!!"
fi
