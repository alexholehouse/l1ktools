function [pkstats, raw] = dpeak(lxbfile, varargin)
% DPEAK Perform peak detection on bead-level L1000 data files.
%   PKSTATS = DPEAK(LXBFILE) Process data from LXBFILE and returns
%   peak-detection statistics. PKSTATS is a structure array of length equal
%   to the number of analytes. See DETECT_LXB_PEAKS_MULTI for a
%   description of the fields in PKSTATS.
%
%   [PKSTATS, RAW] = DPEAK(LXBFILE) returns the bead-level intensity data.
%       RAW is a structure with the following fields.
%   'RID': vector, analyte ids. Ids ranging from [1-500] are to 500 valid
%   bead regions. Ids labeled 0 are unclassified beads and are ignored by
%   dpeak.
%   'RP1': vector, reporter fluorescent intensities of each detected bead.
%
%   [...] = DPEAK(LXBFILE, param1, val1,...) specify optional
%   parameter/value pairs:
%   'out' : string, Filename to save pkstats  tab-delimited textfile.
%
%   See also: PLOT_PEAKS, SAVE_PKSTATS, DETECT_LXB_PEAKS_MULTI

pnames = {'out'};
dflts = {''};
args = parse_args(pnames, dflts, varargin{:});
showfig = ~isempty(args.out);

% read raw data
raw = parse_lxb(lxbfile);

% detect peaks
pkstats = detect_lxb_peaks_multi(raw.RP1, raw.RID, 'showfig', showfig, 'newfig', false, varargin{:});

% save pkstats
if ~isempty(args.out)
    save_pkstats(fullfile(args.out, 'pkstats.txt'), pkstats)
end

end