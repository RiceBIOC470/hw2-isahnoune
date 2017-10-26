function proteinseq = dna2protein(dnaseq,frame)
protein = '';
if frame > 3 || frame < 0
    disp("frame is not valid");
    proteinseq = "";
else 
dnaseq = upper(dnaseq);
dnaseq = char(dnaseq);
dnaseq = dnaseq(frame:end);
T = readtable('codons.csv');

Codon = T(1:64, 2:2);
AmAcid = T(1:64, 1:1);

Codons = table2array(Codon);
AmAcids = table2array(AmAcid);

mapObj = containers.Map(Codons, AmAcids);

for i = 1:length(dnaseq)
    if i+2 < length(dnaseq)
        tempseq = dnaseq(i:i+2);
        protein = strcat(protein,mapObj(tempseq));
    end
end
end
proteinseq = protein; 
end
 
% Input a dna sequence and a reading frame and returns the corresponding
% protein sequence. 