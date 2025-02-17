/*
* STEP - CALCULATE-FREQUENCIES
*
*/
process CALCULATE_FREQUENCIES {
    label 'process_single'
    conda 'envs/postproc-env.yml'

    input:
    path alleledata

    output:
    path("allele_frequencies.tsv"), emit: frequencies

    script:
    """
    Rscript ${projectDir}/bin/calculate_frequencies.R \
    --alleledata ${alleledata}
    """
}
