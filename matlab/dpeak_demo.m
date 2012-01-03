% Demo of scripts

lxbfile = '../data/A10.lxb';
outfile = '../data/A10_pkstats.txt';
sample_analytes = [15, 25, 100, 200, 300];

% plot peak intensity distributions for a few analytes
fprintf ('Plotting distributions...\n');
plot_peaks(lxbfile, sample_analytes);

% detect peaks and save stats to a file
fprintf('Detecting peaks...\n');
[pkstats, raw] = dpeak(lxbfile, 'out', outfile);

fprintf('Done\n')

