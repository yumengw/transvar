
mkdir -p testout

transvar panno -l cosmic/cosmic_panno_frameshift -g 1 -m 4 --ccds | tee testout/panno_cosmic_frameshift

transvar panno -l data/cosmic/cosmic_panno_deletion -g 1 -m 4 --ccds | tee testout/panno_cosmic_deletion

transvar panno -l data/cosmic/cosmic_panno_insertion -g 1 -m 4 --ccds | tee testout/panno_cosmic_insertion

transvar panno -l data/cosmic/cosmic_panno_saav -g 1 -m 4 --ccds | tee testout/panno_cosmic_saav

transvar canno -l data/cosmic/cosmic_canno_snv -g 1 -m 3 --ccds | tee testout/canno_cosmic_snv

transvar canno -l data/cosmic/cosmic_canno_deletion -g 1 -m 3 --ccds | tee testout/canno_cosmic_deletion

transvar canno -l data/cosmic/cosmic_canno_insertion -g 1 -m 3 --ccds | tee testout/canno_cosmic_insertion
colordiff testout/canno_cosmic_insertion golden/canno_cosmic_insertion

transvar panno -l data/tamborero_data/transvar_revprotein_input.txt_ens --ensembl --seqmax -1 | tee testout/panno_tamborero
colordiff testout/panno_tamborero golden/panno_tamborero

transvar ganno --vcf data/tamborero_data/docm_variants_mar_2016.vcf --ensembl | tee testout/ganno_tamborero.vcf
colordiff testout/ganno_tamborero.vcf


## register

python setup.py register -r pypitest

python setup.py sdist upload -r pypitest
