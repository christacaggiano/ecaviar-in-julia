# ecaviar GWAS/eqtl colocalization code
# from Hormozdiari et al (2016)
# rewritten in Julia by C Caggiano (2018)

# add packages
# Pkg.clone("https://github.com/timholy/PositiveFactorizations.jl.git")

include("caviar.jl")

# @TODO take in command line arguments
non_centrality_parameter = 5.7  # defined in paper?
rho = 0  # set to zero in ecaviar code
casual_snp_number = 1  # eventually should be user defined number of snps
gamma = 0.01

# set up caviar model for eqtl and gwas
call_caviar("LDgwas.txt", "gwasFscore.txt")
