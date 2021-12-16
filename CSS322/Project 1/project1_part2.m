% CSS322 Scientific Computing
% Project 1 Part 2
% Paphana Yiwsiw 6222780379 Sec.3

n=80;
[U,~] = qr(randn(n));
[V,~] = qr(randn(n));
Z = diag(2.^(-1:-1:-n));
A = U*Z*V;
[QA,RA] = gsa(A);
[QB,RB] = gsb(A);
diagRA = diag(RA);
diagRB = diag(RB);
diagZ = diag(Z);
x = 1:n;
fig = figure(1);

hold on;
scatter(x,diagRA,'b+');
scatter(x,diagRB,'rx');
scatter(x,diagZ,'ks');
legend('RA','RB','Z');
hold off;


diffAZ = diagZ - diagRA;
diffBZ = diagZ - diagRB;
fprintf("x\tdiagZ\t\tdiagRA\t\tdiffAZ\t\tdiagRB\t\tdiffBZ\n");
for i = x
    fprintf("%d\t%.6f\t%.6f\t%.6f\t%.6f\t%.6f\n",i,diagZ(i),diagRA(i),diffAZ(i),diagRB(i),diffBZ(i));
end

absA = norm(diagRA-diagZ);
fprintf("\nAbsolute Diff. of RA to Z %.36f\n",absA);
absB = norm(diagRB-diagZ);
fprintf("Absolute Diff. of RB to Z %.36f\n",absB);

relA = norm(diagRA-diagZ)/norm(diagZ);
fprintf("\nRelative Diff. of RA to Z %.36f\n",relA);
relB = norm(diagRB-diagZ)/norm(diagZ);
fprintf("Relative Diff. of RB to Z %.36f\n",relB);



% exportgraphics(fig,'Part2_ScatterPlot.png','ContentType','image');
