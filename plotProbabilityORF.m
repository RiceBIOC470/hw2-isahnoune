function tt = plotProbabilityORF(N_ORF)

N = 600;
counter = 0;

for i=1:N
   dnaseq = randdnaseq(i);
   start_pos = strfind(dnaseq, 'ATG');
   stop_pos = [strfind(dnaseq, 'TAA') strfind(dnaseq, 'TAG') strfind(dnaseq, 'TGA')];
   if ~isempty(start_pos) && ~isempty(stop_pos)
      
        
       firstStopCodon = zeros(1,length(start_pos));
        for ii = 1:length(start_pos)
            ORFlengths = stop_pos - start_pos(ii);
            high_length = 1e8;
            low_index = 0;
            for jj = 1:length(ORFlengths)
                if ORFlengths(jj) > 0 && mod(ORFlengths(jj),3) == 0 && ORFlengths(jj) < high_length
                    high_length = ORFlengths(jj);
                    low_index = jj; 
               end
            end
            if low_index > 0
                firstStopCodon(ii) = stop_pos(low_index);  
           else
                firstStopCodon(ii) = start_pos(ii);
            end
        end
        ORFSizes = firstStopCodon - start_pos + 3;
        
       if sum(ORFSizes > 3) > 0  && sum(ORFSizes > N_ORF) > 0
            num = sum(ORFSizes > N_ORF);
            if num > 0
                counter = counter + 1;
            end
       end
   end
   prob = counter/100;
   result(i) = prob;
end

plot(result)

tt = result;
end