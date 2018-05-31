# i/o functions
# may 2018

# should have been added in main, ensures the correct PSD factorization
# is used
using PositiveFactorizations

"""
read_ld(file)

takes in a text file of ld scores
returns a square array (if LD file is correct).
"""
# @TODO check if LD file is formatted correctly
function read_ld(file)
    return readdlm(file)
end

"""
read_zscores(file)

reads a zscore file, assuming a txt file that is tab separated with
the SNP name as the first entry on a line, and the corresponding z-score
is the second entry.
Returns 1xN arrays of the snp names and z-scores.
"""
function read_zscores(file)
    f = open(file)

    snp_names = []
    snp_zscores = []

    for ln in eachline(f)
        name, score = split(ln, "\t")
        push!(snp_names, name)
        push!(snp_zscores, parse(Float64, score))
    end

    close(f)

    return snp_names, snp_zscores
end

"""
check_symmetric(matrix)

wrapper for checking if a matrix is symmetric. I like this name better for
    readability. 
"""
function check_symmetric(matrix)
    issymmetric(matrix)
end

"""
make_positive_semidefinite(matrix)

does a cholesky factorization as given in
https://docs.julialang.org/en/release-0.4/stdlib/linalg/
returns the PSD matrix. Matrix must already be symmetric or will throw error.
"""
function make_positive_semidefinite(matrix)
    if check_symmetric(matrix)
        cholfact(Positive, matrix)
    end
end

"""
check_positive_definite(matrix)

wrapper around the terribly named function that checks if an array is PSD
"""
function check_positive_definite(matrix)
    return isposdef(matrix)
end
