# ecaviar GWAS/eqtl colocalization code
# from Hormozdiari et al (2016)
# rewritten in Julia by C Caggiano (2018)


include("utils.jl")

function main()

  # @TODO take in command line arguments
  non_centrality_parameter = 5.7  # defined in paper?
  rho = 0
  casual_snp_number = 1

  # file names
  gwas_LD = read_files("LDgwas.txt")
  eqtl_LD = read_files("LDeqtl.txt")

  sigma = make_positive_semidefinite(gwas_LD)
  print(check_positive_definite(sigma))
  
end

main()
