% script to run models:
% Some housecleaning
clear all;close all
addpath(genpath('mfiles'));

% Name assign for site
g.name = 'frf_runup';
addpath(g.name)

% Model model choices
g.icshore   = 1;
g.icshorem  = 1;
g.ixbeach   = 0;
g.icms      = 0;
g.ifunwave  = 0;
g.istockdon = 1;

%set some input params like timing and bc's
[in dat]=params(g);

%run some models
out_cs       = run_cshore(g,in);
out_csm      = run_cshorem(g,in);
out_stockdon = run_stockdon(g,in);









