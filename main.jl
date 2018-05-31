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

# @TODO make this function actually return this
gwas_posterior_probability = call_caviar("LDgwas.txt", "gwasFscore.txt", non_centrality_parameter, gamma, rho, casual_snp_number)
eqtl_posterior_probability = call_caviar("LDeqtl.txt", "eqtlFscore.txt", non_centrality_parameter, gamma, rho, casual_snp_number)

# given posteriors, calculate the CLPP value for each SNP? 
calculate_CLPP(gwas_posterior_probability, eqtl_posterior_probability)
