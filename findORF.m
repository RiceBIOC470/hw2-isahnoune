function [ORFlength, start_pos, stop_pos] = findORF(dnaseq)

dnaseq = upper(dnaseq);
maxORF = 0;
starts = strfind(dnaseq, 'ATG');
stops = [strfind(dnaseq, 'TAA') strfind(dnaseq, 'TAG') strfind(dnaseq, 'TGA')];

if ~isempty(starts) && ~isempty(stops)
    firststoppos = zeros(1, length(starts));
for ii = 1:length(starts)
    ORFlength = stops - starts(ii);

    ideal_length = 1e8;
    ideal_index = 0;
    for jj = 1:length(ORFlength)
        if ORFlength(jj) > 0 && ...
                mod(ORFlength(jj),3) == 0 && ...
                ORFlength(jj) < ideal_length
           ideal_length = ORFlength(jj);
           ideal_index = jj;
        end
    end
    if ideal_index > 0
        firststoppos(ii) = stops(ideal_index);
    else
        firststoppos(ii) = starts(ii);
        end
    end
    ORFsize = firststoppos - starts + 3;
    ORFmaxlength = max(ORFsize);
    [ORFmax, ind_max] = max(ORFsize);
    ORFlength = ORFmax + 3;
    if ORFlength ~= 0
        start_pos = starts(ind_max);     
        stop_pos = firststoppos(ind_max);
    else
        start_pos = 0;
        stop_pos = 0;
    end
end
end
% if exist('ORFmaxlength', 'var') && ORFmaxlength > 0
%     disp(['Longest open reading frame is ' int2str(ORFmaxlength) ' base pairs long. Start codon at ' int2str(start_pos(ind_max)) '. Stop codon at 'int2str(firststoppos(inx_max))]);
% else
%     disp('No ORF found');
% end

%[ORFmaxlength, start_pos(ind_max), firststoppos(ind_max)]
%Function to find the length of the longest open reading frame of a
%sequences called dnaseq

%fill in here. 