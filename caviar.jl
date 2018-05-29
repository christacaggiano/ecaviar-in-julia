# caviar methods

type caviarModel
    rho::Float64
    non_centrality_parameter::Float64
    gamma::Float64
    snp_number::Int64
    casual_snp_number::Int64
    sigma::Float64
    probability_causal::AbstractString
    stat::Float64
    rank::Int64
    hist_flag



	double * sigma;
    double * stat;
        char * pcausalSet;
        int * rank;
        bool histFlag;
	PostCal * post;
	string * snpNames;
	string ldFile;
        string zFile;
        string outputFileName;
        string geneMapFile;
end
