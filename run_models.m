% script to run models:
% Some housecleaning
clear all;close all
addpath(genpath('mfiles'));
addpath(genpath('cshorem')); % to access mfiles like 'interp_brad' needed for params.m

% Name assign for site
g.name = 'frf_runup';
addpath(g.name)

% Model model choices
g.icshore   = 1;
g.icshorem  = 1;
g.ixbeach   = 1;
g.icms      = 0;
g.ifunwave  = 0;
g.istockton = 0;

%set some input params like timing and bc's
[in dat]=params(g);

%run some models
%out_cs       = run_cshore(g,in);
%out_csm      = run_cshorem(g,in);
out_stockton = run_stockton(g,in);
out_xbeach   = run_xbeach(g,in);








