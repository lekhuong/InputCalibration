close all
clear all
clc
%
%=========================================================================%
% Cette partie pour lire les résultats expérimentaux.
%Read the experimetal results
%=========================================================================%
%
nomfich = 'Experimental.csv' ;
fid=fopen(nomfich,'r');
result1=[];
result1=fgets(fid);
%
result1=fscanf(fid,['%f' ';' '%f' ';'],[2 inf]);
result1= result1' ;
fclose(fid);
%
% dep1 et charge1 pour les résultats expérimentaux
%
dep1 = result1(:,1) ;
charge1 = result1(:,2)/1000. ;
%charge2 = result1(:,2)/1000. ;
%
figure
plot (dep1,charge1,'k-','linewidth',1 );
%
fid = fopen('Khuong_Parameters.txt','w');
    fprintf (fid,'');
fclose(fid)

fid = fopen('Khuong_Courbes.txt','w');
    fprintf (fid,'');
fclose(fid)
%=========================================================================%
% Cette partie pour optimiser les paramètres du modèle
% Methode Nelder-Mead (fonction ''fminsearch'' dans Matlab)
% Fonction ''fminsearchbd'' pour ajouter boundary conditions
% Vecteur X pour définir les paramètres initiaux du modèles.
%=========================================================================%
%
%% Passerelle entre Matlab - Cast3m
% Parametres
VectX0 = [30e9 0.2 3.5e6 2.2e6 1.2e-2 35e6 5.E-3] ;
%[VectX,fval,exitflag,output] = fminsearchbd(@(VectX) myfun_V2(VectX,sigma_ex_v1),VectX0)
[VectX,fval,exitflag,output] = fminsearch(@(VectX) myfun(VectX,dep1,charge1),VectX0)
%
