# DCM_BHSC

Examples of manupulation of default priors for DCM applied to fMRI data.
Briefly, I have first separately estimated a left and a right intrahemispheric DCM in an fMRI task during grasping execution and imagery (see Bencivenga et al., 2021, Neuroimage). In these example files, I took the intrahemispheric posterior estimates from the PEB results of the A matrix and I put them as priors of an interhemispheric DCM, letting the interhemispheric connections to be estimated with default parameters.
File list:
- PEB_RH_Amatrix: contains the intrahemispheric dynamic couplings of the right hemisphere as resulted by the group PEB analysis;
- DCMstruct_IP: new, intrahemispheric DCM for a single subject (377), where group PEB priors for the A matrix have been set in DCM.options.P. No change to the variance-covariance matrix was made; 
- DCM_IP: inverted DCM for the DCMstruct_IP, with the parameter initialization procedure;
- DCMstruct_SP: new, intrahemispheric DCM for a single subject (377), where group PEB priors for the A matrix have been set in DCM.M.pE. Accordingly, the corresponding variance values in DCM.M.pC have been set to 0; 
- DCM_SP: inverted DCM for the DCMstruct_SP, with the specified, "unmodified" priors.