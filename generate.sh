#!/usr/bin/env bash

declare -A versions
versions=(
    [alpine]='alpine:3.6 alpine:3.7 alpine:latest'
    [debian]='debian:stretch debian:stretch-slim debian:stable debian:stable-slim'
)

declare -A patterns
patterns=(
    [__BASE__]='${version}'
    [__FROM__]='${from}'
    [__DIST__]='${dist}'
    [__IMAGE_TAG__]='${image_tag}'
)

function build_sed_args {
    result=" "
    for pattern in ${!patterns[*]};do
        variable=${patterns[${pattern}]}
        eval value=$variable
        result+=" -e s/${pattern}/${value}/g"
    done
    echo ${result}
}

function install_template {
    #https://stackoverflow.com/a/965072
    tpl_file=$(basename ${1})
    filename="${tpl_file%.*}"
    SED_ARGS=$(build_sed_args)
    sed -e ${SED_ARGS} ${tpl_file} > ${dockerfileDirectory}/${filename}
    chmod a+x ${dockerfileDirectory}/${filename}
    #echo "filename=$filename, tpl=$tpl_file, ARGS = ${SED_ARGS} rep=${dockerfileDirectory}"
}

for dist in ${!versions[*]}; do
    for version in ${versions[${dist}]};do
        tag=$(echo "${version}" | cut -d ":" -f2)
        image_tag=$(echo "${dist}_${tag}")
        dockerfileDirectory="${dist}/${tag}"
        
        #Install rootfs
        mkdir -p ${dockerfileDirectory}
        cp -r -f rootfs ${dockerfileDirectory}
                
        #Install Dockerfile
        #sed -e ${SED_ARGS} Dockerfile.tpl > ${dockerfileDirectory}/Dockerfile
        install_template Dockerfile.tpl
        
        #Install build.sh
        #sed -e ${SED_ARGS} build.sh.tpl > ${dockerfileDirectory}/build.sh
        install_template build.sh.tpl

        #Install run.sh
        install_template run.sh.tpl
    done
done

