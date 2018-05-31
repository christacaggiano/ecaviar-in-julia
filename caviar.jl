# caviar methods

include("utils.jl")

"""
call_caviar()
calls the caviar model
"""
function call_caviar(ld_file, zscore_file, NCP, gamma, rho, casual_snp_number)

    ld = read_ld(ld_file)  # return LD as a square matrix
    snp_names, snp_zscores = read_zscores(zscore_file)  # return snp names and z-scores


    sigma = make_positive_semidefinite(ld)  # unclear if really necessary, in original code, possibly necessary because of how ld was simulated?


    total_likelihood, posterior_probabilites =
        compute_summed_likelihood(casual_snp_number, total_snps, z_stats, gamma)

    retrun sort(posterior_probabilites)

end

"""
compute_summed_likelihood()
"""
function compute_summed_likelihood(casual_snp_number, total_snps, z_stats, gamma)

    exp_num = 0  # i have no idea where this comes from

    # compute total number of summed_likelihood iterations using
    # binomial distribution
    total = 0
    for i = 1:casual_snp_number
        total += binomial(total_snps, i)
    end

    # intialize the array of causals -- this is what was done in the code, but I think
    # something is wrong here, index of causal snps should be set to 1 somewhere
    configure = zeros(total_snps)
    summed_likelihood = 0

    posterior_values = zeros(total_snps)
    for i = 1:total  # believe this is the law of total probabilities
        likelihood = (compute_fast_likelihood() * gamma^exp_num * (1-gamma, total_snps-num)
        summed_likelihood += likelihood
        for j = 1:total_snps

            # ? seems like this will always be 0
            posterior_values[j] = likelihood * configure[j]
        end
    end

    return summed_likelihood, posterior_values
end

# @TODO fill in
function compute_fast_likelihood()
    return 0
end

# @TODO fill in
function compute_mvnorm()
    return 0
end

# @TODO fill in
function sort(posterior_probability)
    return 0
end

# @TODO fill in
function calculate_CLPP(gwas_posterior, eqtl_posterior)

    total_snps = length(gwas_posterior)
    CLPP = 0
    for i = 1:length(total_snps)
        CLPP[i] += gwas_posterior * eqtl_posterior
    end

    return CLPP
end
