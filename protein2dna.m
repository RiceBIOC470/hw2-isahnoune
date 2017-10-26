function dnaseq = protein2dna(dnaseq)
dna = '';

dnaseq = upper(proteinseq);
dnaseq = char(proteinseq);
dnaseq = dnaseq(frame:end);
T = readtable('codons.csv');

Codon = T(1:64, 2:2);
AmAcid = T(1:64, 1:1);

Codons = table2array(Codon);
AmAcids = table2array(AmAcid);

mapObj = containers.Map(AmAcids, Codons);

for i = 1:length(proteinseq)
    if i+2 < length(proteinseq)
        tempseq = proteinseq(i:i+2);
        dna = strcat(dna,mapObj(tempseq));
    end
end
dnaseq = dna; 
end