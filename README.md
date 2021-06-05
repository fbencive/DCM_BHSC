# DCM_BHSC

Examples of manupulation of default priors for DCM applied to fMRI data.
Briefly, I have first separately estimated a left and a right intrahemispheric DCM in an fMRI task during grasping execution and imagery (see Bencivenga et al., 2021, Neuroimage). In these example files, I took the intrahemispheric posterior estimates from the PEB results of the A matrix and I put them as priors of an interhemispheric DCM, letting the interhemispheric connections to be estimated with default parameters.
File list:
- PEB_RH_Amatrix: contains the intrahemispheric dynamic couplings of the right hemisphere as resulted by the group PEB analysis;
- DCMstruct_IP: new, intrahemispheric DCM for a single subject (377), where group PEB priors for the A matrix have been set in DCM.options.P. No change to the variance-covariance matrix was made; 
- DCM_IP: inverted DCM for the DCMstruct_IP, with the parameter initialization procedure;
- DCMstruct_SP: new, intrahemispheric DCM for a single subject (377), where group PEB priors for the A matrix have been set in DCM.M.pE. Accordingly, the corresponding variance values in DCM.M.pC have been set to 0; 
- DCM_SP: inverted DCM for the DCMstruct_SP, with the specified, "unmodified" priors.

PROCEDURE:
load('myPEBfile');
load('myDCMfile');

%get default priors
[pE,C,x,pC] = spm_dcm_fmri_priors(A,B,C,D,options);

%General rule: Uninformed off-diagonal endogenous entries must have pE =
%0.0078. All the endogenous entries must have variance = 0.0156. For more
%see spm_dcm_fmri_priors;
%https://doi.org/10.1016/j.neuroimage.2013.12.009

%% Parameter initialization
%use a for loop to replace values in the pE struct and then put it into
%DCM.options.P. Do not change covariance matrix
pE.A = PEB.Ep;
DCM.options.P = pE;

%% Using specified priors
%use a for loop to replace values in the pE struct and then put it into
%DCM.M.pE. Change covariance matrix accordingly, setting variance = 0 to
%the parameters you want to stay stationary
pE.A = PEB.Ep;
DCM.M.pE = pE;
DCM.M.pC = pC;
