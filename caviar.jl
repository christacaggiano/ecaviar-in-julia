# caviar methods

function likelihood(casual_snp_number, total_snps)
    total = 0

    for i = 1:casual_snp_number
        total += binomial(total_snps, i)
    end

    print(total)
end

likelihood(1, 50)
likelihood(2, 50)
