#!/usr/bin/env bash
export STAN_NUM_THREADS=6
mkdir -p output
rm output/*
Rscript "R/chessB-preprocess.R"
cp input/{mvar,mlen}.csv output/
cp run.sh output/
for v in {1..3}
do
    Rscript "R/chessB-init.R"
    ./main initialize parallel single_w single_z full latent no_gamma $v 10000 10000 10
done
mv output chessB-singleZ-singleW
Rscript "R/run-analysis.R"
