function  edata = BrukerOpenW_pv5(directory)
% Read in acqusition paramters
%  directory='/Users/guanshuliu/Desktop/20110609.glu&lipsomes/gl110609.8t1/42'
	%w  = BrukerPar(directory, 'acqp', 'ACQ_O3_list');

    Matrix_size=BrukerPar(directory, 'method', 'PVM_Matrix');
    edata.TR = BrukerPar(directory, 'method', '$PVM_RepetitionTime');
    M=Matrix_size(1); N=Matrix_size(2); 
    NR =BrukerPar(directory, 'method', 'PVM_NRepetitions');
    NS =BrukerPar(directory, 'method', 'PVM_SPackArrNSlices');
    NE =BrukerPar(directory, 'method', 'PVM_NEchoImages');
    
    edata.B0_MHz = BrukerPar(directory, 'acqp', 'BF1');
    edata.power_uT = BrukerPar(directory, 'method', 'PVM_MagTransPower');
    %edata.offset_Hz = [ BrukerPar(directory, 'method', 'MT_Offsets_NoM0') 20000];
    %edata.offset_Hz = [BrukerPar(directory, 'method', 'MT_Offsets_NoM0')];
    edata.offset_Hz = [BrukerPar(directory, 'method', 'PVM_ppgFreqList1')];
    %w  = BrukerPar(directory, 'acqp', 'ACQ_O3_list(')
	% Read in recostruction parameters
    subdir=[ directory '/pdata/1/'];
	bb = BrukerPar(subdir, 'reco', 'RECO_map_slope');
	Doffset = BrukerPar(subdir, 'reco', 'RECO_map_offset');
 	if BrukerParStr(subdir, 'reco', 'RECO_wordtype')=='_32BIT_SGN_INT'  %% to be changed how to extract 16 or 32
    wordtype='32';
    elseif BrukerParStr(subdir, 'reco', 'RECO_wordtype')=='_16BIT_SGN_INT'  wordtype='16';
    else error ('not 16 bit or 32 bit data'); 
    end 
    
d = read_2dseq(directory, [M, N, NE, NS, NR], wordtype) ;
d=squeeze(d); 
MI=d;
for k=1:NR*NS*NE
                MI(:,:,k) = d(:,:,k) ./ bb(k) - Doffset(k);
end

edata.data = MI;



function NUM= BrukerPar(loc, file, parameter)
filename=fullfile(loc, file);


fid = fopen(filename); 
% if fid > 1 
%     while fid >1
%         fclose
% if fid > 1
% 
%     while fid~=0
%         fclose(fid);
%     end
%     fid = fopen(filename); 
% end

if fid ~= -1
    currentfile= fid;
else
    currentfile = -1;
end

while currentfile==fid
     tline = fgetl(fid);
     
     if ~ischar(tline), break, end
     
     if ~isempty (strfind(tline, parameter))     
    
         if (isempty (strfind(tline, '(')))
             ind1=strfind(tline, '=');
             NUM=tline (ind1+1:end);
         else 
             ind1=strfind(tline, '('); 
             ind2=strfind(tline, ')'); 
             num_element=str2num(tline(ind1+1: ind2-1));
             tline = fgetl(fid);
             NUM=tline;

                             while length (str2num(NUM))<num_element
%                                  disp('loop2')
                                        tline = fgetl(fid);
                                        NUM=[NUM tline];
                             end
            end
          
   break,   end

end 


NUM=str2num(NUM);
fclose(fid);    

function NUM= BrukerParStr(loc, file, parameter)

filename=fullfile(loc, file);
fid = fopen(filename); 

% if fid > 1
% 
%     while fid~=0
%         fclose(fid);
%     end
%     fid = fopen(filename); 
% end
if fid ~= -1
    currentfile= fid;
else
    currentfile = -1;
end

while currentfile==fid
     tline = fgetl(fid);

     
     if ~ischar(tline), break, end
     
     if ~isempty (strfind(tline, parameter))     
    
         if (isempty (strfind(tline, '(')))
             ind1=strfind(tline, '=');
             NUM=tline (ind1+1:end);
         else 
             ind1=strfind(tline, '('); 
             ind2=strfind(tline, ')'); 
             num_element=str2num(tline(ind1+1: ind2-1));
             tline = fopen(fid);
             NUM=tline;

                             while length (str2num(NUM))<num_element
%                                  disp('loop2')
                                        tline = fopen(fid);
                                        NUM=[NUM tline];
                             end
            end
          
   break,   end

end 


fclose(fid);    

function image = read_2dseq(fname, ds, Bit )

filename=[ fname '/pdata/1/2dseq'];
recon=fopen(filename,'r+','l');
 if strcmp(Bit, '16')
       image_1D= fread(recon, prod(ds), 'int16');  % RECO_image_type=COMPLEX_IMAGE
      else
         image_1D= fread(recon, prod(ds), 'int32');  % RECO_image_type=COMPLEX_IMAGE
 end
      
fclose(recon);
image = reshape(image_1D, ds);

   
                        
 % read a 2dseq file and display in matlab
