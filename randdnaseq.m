function randomSeq = randdnaseq(N)
dnaletters = ['A', 'T', 'G', 'C'];
randomSeq = dnaletters(randi(4, 1, N));
end

% returns a random dna sequence of length N
