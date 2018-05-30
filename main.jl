# ecaviar GWAS/eqtl colocalization code
# from Hormozdiari et al (2016)
# rewritten in Julia by C Caggiano (2018)

# add packages
# Pkg.clone("https://github.com/timholy/PositiveFactorizations.jl.git")

include("utils.jl")


# @TODO take in command line arguments
non_centrality_parameter = 5.7  # defined in paper?
rho = 0
casual_snp_number = 1

# file names
gwas_LD = read_files("/Users/Christa.Caggiano/Documents/UCSF_year1/biostats/caviar/CAVIAR-C++/sample_data/50_LD.txt")
print(size(gwas_LD))

eqtl_LD = read_files("LDeqtl.txt")
sigma = make_positive_semidefinite(gwas_LD)
print(eig(Array(sigma)))
