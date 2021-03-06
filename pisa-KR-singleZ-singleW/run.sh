#!/usr/bin/env bash
export STAN_NUM_THREADS=11
mkdir -p output
rm output/*
Rscript "R/pisa-KR-preprocess.R"
cp input/{mvar,mlen}.csv output/
cp run.sh output/
for v in {1..3}
do
Rscript "R/pisa-KR-init.R"
./main initialize parallel single_w single_z full latent no_gamma $v 10000 10000 10
done
mv output pisa-KR-singleZ-singleW

#!/usr/bin/env bash
export STAN_NUM_THREADS=11
mkdir -p output
rm output/*
Rscript "R/pisa-preprocess.R"
cp input/{mvar,mlen}.csv output/
cp run.sh output/
for v in {1..3}
do
Rscript "R/pisa-init.R"
./main parallel single_w single_z full latent no_gamma $v 10000 10000 10
done
mv output pisa-singleZ-singleW

rm output/*
mkdir -p output
Rscript "R/verbal-preprocess.R"
cp input/{mvar,mlen}.csv output/
cp run.sh output/
for v in {1..3}
do
Rscript "R/verbal-init.R"
./main parallel single_w single_z sparse latent no_gamma $v 10000 10000 10
done
mv output verbal-singleZ-singleW

rm output/*
mkdir -p output
Rscript "R/opusIII-preprocess.R"
cp input/{mvar,mlen}.csv output/
cp run.sh output/
for v in {1..3}
do
Rscript "R/opusIII-init.R"
./main parallel single_w single_z sparse latent no_gamma $v 10000 10000 10
done
mv output opusIII-singleZ-singleW
