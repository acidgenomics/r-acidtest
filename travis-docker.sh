env | sort
pkg="acidtest"
image="acidgenomics/basejump"
docker pull "$image"
docker run -ti --volume="${PWD}:/${pkg}" --workdir="/${pkg}" "$image" Rscript -e 'source("travis-docker.R")'
