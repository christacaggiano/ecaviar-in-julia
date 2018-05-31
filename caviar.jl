# caviar methods

include("utils.jl")

function call_caviar(ld_file, zscore_file)
    ld = read_ld(ld_file)
    read_zscores(zscore_file)
    # sigma = make_positive_semidefinite(ld)
    # snp_names =
end


function compute_summed_likelihood(casual_snp_number, total_snps, z_stats)
    total = 0
    base_value = max(abs(z_stats))^2

    for i = 1:casual_snp_number
        total += binomial(total_snps, i)
    end

    configure = zeros(total_snps)

end

# parameters
