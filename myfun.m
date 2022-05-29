function resnorm = myfun(VectX,dep1,charge1)

%% Calculer les resultats numeriques
%
lenVectX = length(VectX) ;
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numerique is the result calculated by Cas3M
delete('Numerique.csv')
%
%% Creer le fichier 'parametres' pour Cast3m
%
fid = fopen('parametres.txt','w');
    for k = 1:lenVectX
      fprintf (fid,'%f\n',VectX(k));
    end  
fclose(fid)
%
%% Run Cast3m (Cast3m et lire fichier 'parametres' dans son programe)
%Chu y la cau lenh duoi day se goi cast3m de chay file tinh (xem file code file_cast3M.dgibi tren thu muc)
!castem21.bat file_cast3M.dgibi
%
% Phan cau lenh duoi day la de Matlab no doi ket qua tinh toan cua Cast3m
fin1 = exist('Numerique.csv','file') ;
while (fin1==0)
    pause(5) ;
    fin1 = exist('Numerique.csv','file') ;
end
    pause(2)
%    
%
%
%% Dung Matlab de doc file ket qua xuat ra cua Cast3m
%
nomfich = 'Numerique.csv' ;
fid=fopen(nomfich,'r');
    result2=fgets(fid);
    result2=fscanf(fid,['%f' ';' '%f' ';'],[2 inf]);
fclose(fid);
%
charge2(:,1) = result2(2,:)/1000. ;
chargeK = result2(2,:)/1000. ;
%

%% Comparaison les resultats numerique-experimental
hold on
plot (dep1,chargeK,'*','linewidth',2 );

resnorm = norm(charge1 - charge2)

%%Ghi ra file
fid = fopen('Khuong_Parameters.txt','a');
    for k = 1:lenVectX
      fprintf (fid,'%f;',VectX(k));
    end  
    fprintf (fid,'%f;\n',resnorm);
fclose(fid)

lenVectX = length(VectX) ;
fid = fopen('Khuong_Courbes.txt','a');
    for k = 1:length(chargeK)
      fprintf (fid,'%f;',chargeK(k));
    end  
    fprintf (fid,'\n');
fclose(fid)




