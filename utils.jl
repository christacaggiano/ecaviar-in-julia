# i/o functions
# may 2018

using PositiveFactorizations

function read_ld(file)
    return readdlm(file)
end

function read_zscores(file)
    f = open(file)
    for ln in eachline(f)
        print(ln)
    end
    close(f)
end

function check_symmetric(matrix)
    issymmetric(matrix)
end

function make_positive_semidefinite(matrix)
    cholfact(Positive, matrix)
end

function check_positive_definite(matrix)
    return isposdef(matrix)
end
