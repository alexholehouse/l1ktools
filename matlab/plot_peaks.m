function plot_peaks(lxbfile, analyte, varargin)
% PLOT_PEAKS Plot detected peaks from L1000 data.
%   PLOT_PEAKS(LXBFILE, ANALYTE) Plots peaks from LXBFILE. ANALYTE is a
%   numeric vector of analyte IDs, ranging from [1, 500]
%
%   PLOT_PEAKS(LXBFILE, ANALYTE, param1, value1,...) specify optional
%   parameter/value pairs. See DETECT_LXB_PEAKS_MULTI and
%   DETECT_LXB_PEAKS_SINGLE for a description.
%
% See also: DPEAK, DETECT_LXB_PEAKS_MULTI, DETECT_LXB_PEAKS_SINGLE

error(nargchk(2,2, nargin))

lxb = parse_lxb(lxbfile);
detect_lxb_peaks_multi(lxb.RP1, lxb.RID, varargin{:}, ...
    'analyte', analyte, 'showfig', true);

end