clc;
clear all;
% workingDir='E:\creation phrases\Signer1';
% mkdir(workingDir);
% mkdir(workingDir,'PROCESSED FRAMES');
% mkdir(workingDir,'FRAMES');
% vpath='E:\ISL DATABASE\Signer 1\phrases\training';
% vformat='.wmv';
% codeword_signer1=[];
% for a=1:1:10
%     for b=1:1:3
%         part1=[];
%         part2=[];
%         part1ad=zeros(28,28);
%         part2ad=zeros(28,28);
%         count1=0;
%         count2=0;
%         part3=[];
%         part4=[];
%         part3ad=zeros(28,28);
%         part4ad=zeros(28,28);
%         count3=0;
%         count4=0;
%         part5=[];
%         part6=[];
%         part5ad=zeros(28,28);
%         part6ad=zeros(28,28);
%         count5=0;
%         count6=0;
%         A=[];
%         imm1=zeros(28,28);
%         prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
%         video=VideoReader(strcat(prefix_video,vformat));
%         n=video.NumberOfFrames;
%         for i=1:1:n
%             frame= read(video,i);
%             imwrite(frame,fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%         end
%         for i=1:1:n-2
%             image1=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%             image2=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
%             img1=(imcrop(image1,[180,45,290,300]));
%             img2=(imcrop(image2,[180,45,290,300]));
%             i1=rgb2gray(img1);
%             img3=img1-img2;
%             t=0.2*mean2(i1);
%             img4=t*img3;
%             i4=im2bw(img4);
%             img5=edge(i1,'canny');
%             img6=and(i4,img5);
%             cb=img1(:,:,2);
%             cr=img1(:,:,3);
%             cb2=[];
%             cr2=[];
%             [r c]=size(cb);
%             for ii=1:r
%                 for j=1:c
%                     if(cb(ii,j)>=77 && cb(ii,j)<=127)
%                         cb2(ii,j)=cb(ii,j);
%                     else
%                         cb2(ii,j)=0;
%                     end
%                     if(cr(ii,j)>=134 && cr(ii,j)<=173)
%                         cr2(ii,j)=cr(ii,j);
%                     else
%                         cr2(ii,j)=0;
%                     end
%                 end
%             end
%             img7_1(:,:,2)=cb2;
%             img7_1(:,:,3)=cr2;
%             i7=im2bw(img7_1);
%             i8=and(img6,i7);
%             imwrite(i8,fullfile(workingDir,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%             i_fft=fft2(i8);
%             i_fftab=abs(i_fft);
%             for xx=1:1:28
%                 for yy=1:1:28
%                     i_disc(xx,yy)=i_fftab(xx,yy);
%                     imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
%                 end
%             end
%             i_disc(1,1)=0;
%             imm1(1,1)=0;
%             A=[A i_disc];
%         end
%         c1=imm1./i;
%         c2=c1+1;
%         c3=c1-1;
%         [x y]=size(i_disc);
%         [m n]=size(A);
%         for aa1=0:x:n-x
%             I=A(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist1=0;
%             dist2=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
%                     dist1=dist1+d1;
%                 end
%             end
%             eudi1=sqrt(dist1);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
%                     dist2=dist2+d2;
%                 end
%             end
%             eudi2=sqrt(dist2);
%             if eudi1<=eudi2
%                 part1=[part1 I];
%                 count1=count1+1;
%                 part1ad=part1ad+I;
%             else
%                 part2=[part2 I];
%                 count2=count2+1;
%                 part2ad=part2ad+I;
%             end
%         end
%         C2=part1ad./count1;
%         C3=part2ad./count2;
%         c4=C2+1;
%         c5=C2-1;
%         c6=C3+1;
%         c7=C3-1;
%         [m n]=size(part1);
%         [x y]=size(c4);
%         for aa1=0:x:n-x
%             I=part1(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist3=0;
%             dist4=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
%                     dist3=dist3+d3;
%                 end
%             end
%             eudi3=sqrt(dist3);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
%                     dist4=dist4+d4;
%                 end
%             end
%             eudi4=sqrt(dist4);
%             if eudi3<=eudi4
%                 part3=[part3 I];
%                 count3=count3+1;
%                 part3ad=part3ad+I;
%             else
%                 part4=[part4 I];
%                 count4=count4+1;
%                 part4ad=part4ad+I;
%             end
%         end
%         C4=part3ad./count3;
%         C5=part4ad./count4;
%         
%         [m n]=size(part2);
%         [x y]=size(c6);
%         for aa1=0:x:n-x
%             I=part2(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist5=0;
%             dist6=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
%                     dist5=dist5+d5;
%                 end
%             end
%             eudi5=sqrt(dist5);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
%                     dist6=dist6+d6;
%                 end
%             end
%             eudi6=sqrt(dist6);
%             if eudi5<eudi6
%                 part5=[part5 I];
%                 count5=count5+1;
%                 part5ad=part5ad+I;
%             else
%                 part6=[part6 I];
%                 count6=count6+1;
%                 part6ad=part6ad+I;
%             end
%         end
%         C6=part5ad./count5;
%         C7=part6ad./count6;
%         codeword1=[C4 C5 C6 C7];
%         codeword_signer1=[codeword_signer1 codeword1];
%         xlswrite('signer1.xlsx',codeword_signer1);
%     end
% end
% workingDir2='E:\creation phrases\Signer2';
% mkdir(workingDir2);
% mkdir(workingDir2,'PROCESSED FRAMES');
% mkdir(workingDir2,'FRAMES');
% vpath='E:\ISL DATABASE\Signer 2\phrases\training';
% vformat='.wmv';
% codeword_signer2=[];
% for a=1:1:10
%     for b=1:1:3
%         part1=[];
%         part2=[];
%         part1ad=zeros(28,28);
%         part2ad=zeros(28,28);
%         count1=0;
%         count2=0;
%         part3=[];
%         part4=[];
%         part3ad=zeros(28,28);
%         part4ad=zeros(28,28);
%         count3=0;
%         count4=0;
%         part5=[];
%         part6=[];
%         part5ad=zeros(28,28);
%         part6ad=zeros(28,28);
%         count5=0;
%         count6=0;
%         A=[];
%         imm1=zeros(28,28);
%         prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
%         video=VideoReader(strcat(prefix_video,vformat));
%         n=video.NumberOfFrames;
%         for i=1:1:n
%             frame= read(video,i);
%             imwrite(frame,fullfile(workingDir2,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%         end
%         for i=1:1:n-2
%             image1=imread(fullfile(workingDir2,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%             image2=imread(fullfile(workingDir2,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
%             img1=(imcrop(image1,[100,20,330,300]));
%             img2=(imcrop(image2,[100,20,330,300]));
%             i1=rgb2gray(img1);
%             img3=img1-img2;
%             t=0.2*mean2(i1);
%             img4=t*img3;
%             i4=im2bw(img4);
%             img5=edge(i1,'canny');
%             img6=and(i4,img5);
%             cb=img1(:,:,2);
%             cr=img1(:,:,3);
%             cb2=[];
%             cr2=[];
%             [r c]=size(cb);
%             for ii=1:r
%                 for j=1:c
%                     if(cb(ii,j)>=77 && cb(ii,j)<=127)
%                         cb2(ii,j)=cb(ii,j);
%                     else
%                         cb2(ii,j)=0;
%                     end
%                     if(cr(ii,j)>=134 && cr(ii,j)<=173)
%                         cr2(ii,j)=cr(ii,j);
%                     else
%                         cr2(ii,j)=0;
%                     end
%                 end
%             end
%             img7_2(:,:,2)=cb2;
%             img7_2(:,:,3)=cr2;
%             i7=im2bw(img7_2);
%             i8=and(img6,i7);
%             imwrite(i8,fullfile(workingDir2,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%             i_fft=fft2(i8);
%             i_fftab=abs(i_fft);
%             for xx=1:1:28
%                 for yy=1:1:28
%                     i_disc(xx,yy)=i_fftab(xx,yy);
%                     imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
%                 end
%             end
%             i_disc(1,1)=0;
%             imm1(1,1)=0;
%             A=[A i_disc];
%         end
%         c1=imm1./i;
%         c2=c1+1;
%         c3=c1-1;
%         [x y]=size(i_disc);
%         [m n]=size(A);
%         for aa1=0:x:n-x
%             I=A(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist1=0;
%             dist2=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
%                     dist1=dist1+d1;
%                 end
%             end
%             eudi1=sqrt(dist1);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
%                     dist2=dist2+d2;
%                 end
%             end
%             eudi2=sqrt(dist2);
%             if eudi1<=eudi2
%                 part1=[part1 I];
%                 count1=count1+1;
%                 part1ad=part1ad+I;
%             else
%                 part2=[part2 I];
%                 count2=count2+1;
%                 part2ad=part2ad+I;
%             end
%         end
%         C2=part1ad./count1;
%         C3=part2ad./count2;
%         c4=C2+1;
%         c5=C2-1;
%         c6=C3+1;
%         c7=C3-1;
%         [m n]=size(part1);
%         [x y]=size(c4);
%         for aa1=0:x:n-x
%             I=part1(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist3=0;
%             dist4=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
%                     dist3=dist3+d3;
%                 end
%             end
%             eudi3=sqrt(dist3);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
%                     dist4=dist4+d4;
%                 end
%             end
%             eudi4=sqrt(dist4);
%             if eudi3<=eudi4
%                 part3=[part3 I];
%                 count3=count3+1;
%                 part3ad=part3ad+I;
%             else
%                 part4=[part4 I];
%                 count4=count4+1;
%                 part4ad=part4ad+I;
%             end
%         end
%         C4=part3ad./count3;
%         C5=part4ad./count4;
%         [m n]=size(part2);
%         [x y]=size(c6);
%         for aa1=0:x:n-x
%             I=part2(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist5=0;
%             dist6=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
%                     dist5=dist5+d5;
%                 end
%             end
%             eudi5=sqrt(dist5);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
%                     dist6=dist6+d6;
%                 end
%             end
%             eudi6=sqrt(dist6);
%             if eudi5<eudi6
%                 part5=[part5 I];
%                 count5=count5+1;
%                 part5ad=part5ad+I;
%             else
%                 part6=[part6 I];
%                 count6=count6+1;
%                 part6ad=part6ad+I;
%             end
%         end
%         C6=part5ad./count5;
%         C7=part6ad./count6;
%         codeword2=[C4 C5 C6 C7];
%         codeword_signer2=[codeword_signer2 codeword2];
%         xlswrite('signer2.xlsx',codeword_signer2);
%     end
% end
% workingDir3='E:\creation phrases\Signer3';
% mkdir(workingDir3);
% mkdir(workingDir3,'PROCESSED FRAMES');
% mkdir(workingDir3,'FRAMES');
% vpath='E:\ISL DATABASE\Signer 3\phrases\training';
% vformat='.wmv';
% codeword_signer3=[];
% for a=1:1:10
%     for b=1:1:3
%         part1=[];
%         part2=[];
%         part1ad=zeros(28,28);
%         part2ad=zeros(28,28);
%         count1=0;
%         count2=0;
%         part3=[];
%         part4=[];
%         part3ad=zeros(28,28);
%         part4ad=zeros(28,28);
%         count3=0;
%         count4=0;
%         part5=[];
%         part6=[];
%         part5ad=zeros(28,28);
%         part6ad=zeros(28,28);
%         count5=0;
%         count6=0;
%         A=[];
%         imm1=zeros(28,28);
%         prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
%         video=VideoReader(strcat(prefix_video,vformat));
%         n=video.NumberOfFrames;
%         for i=1:1:n
%             frame= read(video,i);
%             imwrite(frame,fullfile(workingDir3,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%         end
%         for i=1:1:n-2
%             image1=imread(fullfile(workingDir3,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%             image2=imread(fullfile(workingDir3,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
%             img1=(imcrop(image1,[160,0,370,330]));
%             img2=(imcrop(image2,[160,0,370,330]));
%             i1=rgb2gray(img1);
%             img3=img1-img2;
%             t=0.2*mean2(i1);
%             img4=t*img3;
%             i4=im2bw(img4);
%             img5=edge(i1,'canny');
%             img6=and(i4,img5);
%             cb=img1(:,:,2);
%             cr=img1(:,:,3);
%             cb2=[];
%             cr2=[];
%             [r c]=size(cb);
%             for ii=1:r
%                 for j=1:c
%                     if(cb(ii,j)>=77 && cb(ii,j)<=127)
%                         cb2(ii,j)=cb(ii,j);
%                     else
%                         cb2(ii,j)=0;
%                     end
%                     if(cr(ii,j)>=134 && cr(ii,j)<=173)
%                         cr2(ii,j)=cr(ii,j);
%                     else
%                         cr2(ii,j)=0;
%                     end
%                 end
%             end
%             img7_3(:,:,2)=cb2;
%             img7_3(:,:,3)=cr2;
%             i7=im2bw(img7_3);
%             i8=and(img6,i7);
%             imwrite(i8,fullfile(workingDir3,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%             i_fft=fft2(i8);
%             i_fftab=abs(i_fft);
%             for xx=1:1:28
%                 for yy=1:1:28
%                     i_disc(xx,yy)=i_fftab(xx,yy);
%                     imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
%                 end
%             end
%             i_disc(1,1)=0;
%             imm1(1,1)=0;
%             A=[A i_disc];
%         end
%         c1=imm1./i;
%         c2=c1+1;
%         c3=c1-1;
%         [x y]=size(i_disc);
%         [m n]=size(A);
%         for aa1=0:x:n-x
%             I=A(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist1=0;
%             dist2=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
%                     dist1=dist1+d1;
%                 end
%             end
%             eudi1=sqrt(dist1);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
%                     dist2=dist2+d2;
%                 end
%             end
%             eudi2=sqrt(dist2);
%             if eudi1<=eudi2
%                 part1=[part1 I];
%                 count1=count1+1;
%                 part1ad=part1ad+I;
%             else
%                 part2=[part2 I];
%                 count2=count2+1;
%                 part2ad=part2ad+I;
%             end
%         end
%         C2=part1ad./count1;
%         C3=part2ad./count2;
%         c4=C2+1;
%         c5=C2-1;
%         c6=C3+1;
%         c7=C3-1;
%         [m n]=size(part1);
%         [x y]=size(c4);
%         for aa1=0:x:n-x
%             I=part1(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist3=0;
%             dist4=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
%                     dist3=dist3+d3;
%                 end
%             end
%             eudi3=sqrt(dist3);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
%                     dist4=dist4+d4;
%                 end
%             end
%             eudi4=sqrt(dist4);
%             if eudi3<=eudi4
%                 part3=[part3 I];
%                 count3=count3+1;
%                 part3ad=part3ad+I;
%             else
%                 part4=[part4 I];
%                 count4=count4+1;
%                 part4ad=part4ad+I;
%             end
%         end
%         C4=part3ad./count3;
%         C5=part4ad./count4;
%         [m n]=size(part2);
%         [x y]=size(c6);
%         for aa1=0:x:n-x
%             I=part2(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist5=0;
%             dist6=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
%                     dist5=dist5+d5;
%                 end
%             end
%             eudi5=sqrt(dist5);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
%                     dist6=dist6+d6;
%                 end
%             end
%             eudi6=sqrt(dist6);
%             if eudi5<eudi6
%                 part5=[part5 I];
%                 count5=count5+1;
%                 part5ad=part5ad+I;
%             else
%                 part6=[part6 I];
%                 count6=count6+1;
%                 part6ad=part6ad+I;
%             end
%         end
%         C6=part5ad./count5;
%         C7=part6ad./count6;
%         codeword3=[C4 C5 C6 C7];
%         codeword_signer3=[codeword_signer3 codeword3];
%         xlswrite('signer3.xlsx',codeword_signer3);
%     end
% end
% workingDir4='E:\creation phrases\Signer4';
% mkdir(workingDir4);
% mkdir(workingDir4,'PROCESSED FRAMES');
% mkdir(workingDir4,'FRAMES');
% vpath='E:\ISL DATABASE\Signer 4\phrases\training';
% vformat='.wmv';
% codeword_signer4=[];
% for a=1:1:10
%     for b=1:1:3
%         part1=[];
%         part2=[];
%         part1ad=zeros(28,28);
%         part2ad=zeros(28,28);
%         count1=0;
%         count2=0;
%         part3=[];
%         part4=[];
%         part3ad=zeros(28,28);
%         part4ad=zeros(28,28);
%         count3=0;
%         count4=0;
%         part5=[];
%         part6=[];
%         part5ad=zeros(28,28);
%         part6ad=zeros(28,28);
%         count5=0;
%         count6=0;
%         A=[];
%         imm1=zeros(28,28);
%         prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
%         video=VideoReader(strcat(prefix_video,vformat));
%         n=video.NumberOfFrames;
%         for i=1:1:n
%             frame= read(video,i);
%             imwrite(frame,fullfile(workingDir4,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%         end
%         for i=1:1:n-2
%             image1=imread(fullfile(workingDir4,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%             image2=imread(fullfile(workingDir4,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
%             img1=(imcrop(image1,[150,0,370,330]));
%             img2=(imcrop(image2,[150,0,370,330]));
%             i1=rgb2gray(img1);
%             img3=img1-img2;
%             t=0.2*mean2(i1);
%             img4=t*img3;
%             i4=im2bw(img4);
%             img5=edge(i1,'canny');
%             img6=and(i4,img5);
%             cb=img1(:,:,2);
%             cr=img1(:,:,3);
%             cb2=[];
%             cr2=[];
%             [r c]=size(cb);
%             for ii=1:r
%                 for j=1:c
%                     if(cb(ii,j)>=77 && cb(ii,j)<=127)
%                         cb2(ii,j)=cb(ii,j);
%                     else
%                         cb2(ii,j)=0;
%                     end
%                     if(cr(ii,j)>=134 && cr(ii,j)<=173)
%                         cr2(ii,j)=cr(ii,j);
%                     else
%                         cr2(ii,j)=0;
%                     end
%                 end
%             end
%             img7_4(:,:,2)=cb2;
%             img7_4(:,:,3)=cr2;
%             i7=im2bw(img7_4);
%             i8=and(img6,i7);
%             imwrite(i8,fullfile(workingDir4,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
%             i_fft=fft2(i8);
%             i_fftab=abs(i_fft);
%             for xx=1:1:28
%                 for yy=1:1:28
%                     i_disc(xx,yy)=i_fftab(xx,yy);
%                     imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
%                 end
%             end
%             i_disc(1,1)=0;
%             imm1(1,1)=0;
%             A=[A i_disc];
%         end
%         c1=imm1./i;
%         c2=c1+1;
%         c3=c1-1;
%         [x y]=size(i_disc);
%         [m n]=size(A);
%         for aa1=0:x:n-x
%             I=A(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist1=0;
%             dist2=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
%                     dist1=dist1+d1;
%                 end
%             end
%             eudi1=sqrt(dist1);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
%                     dist2=dist2+d2;
%                 end
%             end
%             eudi2=sqrt(dist2);
%             if eudi1<=eudi2
%                 part1=[part1 I];
%                 count1=count1+1;
%                 part1ad=part1ad+I;
%             else
%                 part2=[part2 I];
%                 count2=count2+1;
%                 part2ad=part2ad+I;
%             end
%         end
%         C2=part1ad./count1;
%         C3=part2ad./count2;
%         c4=C2+1;
%         c5=C2-1;
%         c6=C3+1;
%         c7=C3-1;
%         [m n]=size(part1);
%         [x y]=size(c4);
%         for aa1=0:x:n-x
%             I=part1(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist3=0;
%             dist4=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
%                     dist3=dist3+d3;
%                 end
%             end
%             eudi3=sqrt(dist3);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
%                     dist4=dist4+d4;
%                 end
%             end
%             eudi4=sqrt(dist4);
%             if eudi3<=eudi4
%                 part3=[part3 I];
%                 count3=count3+1;
%                 part3ad=part3ad+I;
%             else
%                 part4=[part4 I];
%                 count4=count4+1;
%                 part4ad=part4ad+I;
%             end
%         end
%         C4=part3ad./count3;
%         C5=part4ad./count4;
%         
%         [m n]=size(part2);
%         [x y]=size(c6);
%         for aa1=0:x:n-x
%             I=part2(:,aa1+1:aa1+x);
%             [a1 b1]=size(I);
%             dist5=0;
%             dist6=0;
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
%                     dist5=dist5+d5;
%                 end
%             end
%             eudi5=sqrt(dist5);
%             for i2=1:1:a1
%                 for j2=1:1:b1
%                     d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
%                     dist6=dist6+d6;
%                 end
%             end
%             eudi6=sqrt(dist6);
%             if eudi5<eudi6
%                 part5=[part5 I];
%                 count5=count5+1;
%                 part5ad=part5ad+I;
%             else
%                 part6=[part6 I];
%                 count6=count6+1;
%                 part6ad=part6ad+I;
%             end
%         end
%         C6=part5ad./count5;
%         C7=part6ad./count6;
%         codeword4=[C4 C5 C6 C7];
%         codeword_signer4=[codeword_signer4 codeword4];
%         xlswrite('signer4.xlsx',codeword_signer4);
%     end
% end
workingDir5='E:\creation phrases\Signer5';
mkdir(workingDir5);
mkdir(workingDir5,'PROCESSED FRAMES');
mkdir(workingDir5,'FRAMES');
vpath='E:\ISL DATABASE\Signer 5\phrases\training';
vformat='.wmv';
codeword_signer5=[];
for a=1:1:10
    for b=1:1:3
        part1=[];
        part2=[];
        part1ad=zeros(28,28);
        part2ad=zeros(28,28);
        count1=0;
        count2=0;
        part3=[];
        part4=[];
        part3ad=zeros(28,28);
        part4ad=zeros(28,28);
        count3=0;
        count4=0;
        part5=[];
        part6=[];
        part5ad=zeros(28,28);
        part6ad=zeros(28,28);
        count5=0;
        count6=0;
        A=[];
        imm1=zeros(28,28);
        prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
        video=VideoReader(strcat(prefix_video,vformat));
        n=video.NumberOfFrames;
        for i=1:1:n
            frame= read(video,i);
            imwrite(frame,fullfile(workingDir5,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
        end
        for i=1:1:n-2
            image1=imread(fullfile(workingDir5,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            image2=imread(fullfile(workingDir5,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
            img1=(imcrop(image1,[100,0,300,330]));
            img2=(imcrop(image2,[100,0,300,330]));
            i1=rgb2gray(img1);
            img3=img1-img2;
            t=0.2*mean2(i1);
            img4=t*img3;
            i4=im2bw(img4);
            img5=edge(i1,'canny');
            img6=and(i4,img5);
            cb=img1(:,:,2);
            cr=img1(:,:,3);
            cb2=[];
            cr2=[];
            [r c]=size(cb);
            for ii=1:r
                for j=1:c
                    if(cb(ii,j)>=77 && cb(ii,j)<=127)
                        cb2(ii,j)=cb(ii,j);
                    else
                        cb2(ii,j)=0;
                    end
                    if(cr(ii,j)>=134 && cr(ii,j)<=173)
                        cr2(ii,j)=cr(ii,j);
                    else
                        cr2(ii,j)=0;
                    end
                end
            end
            img7_5(:,:,2)=cb2;
            img7_5(:,:,3)=cr2;
            i7=im2bw(img7_5);
            i8=and(img6,i7);
            imwrite(i8,fullfile(workingDir5,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            i_fft=fft2(i8);
            i_fftab=abs(i_fft);
            for xx=1:1:28
                for yy=1:1:28
                    i_disc(xx,yy)=i_fftab(xx,yy);
                    imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
                end
            end
            i_disc(1,1)=0;
            imm1(1,1)=0;
            A=[A i_disc];
        end
        c1=imm1./i;
        c2=c1+1;
        c3=c1-1;
        [x y]=size(i_disc);
        [m n]=size(A);
        for aa1=0:x:n-x
            I=A(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist1=0;
            dist2=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
                    dist1=dist1+d1;
                end
            end
            eudi1=sqrt(dist1);
            for i2=1:1:a1
                for j2=1:1:b1
                    d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
                    dist2=dist2+d2;
                end
            end
            eudi2=sqrt(dist2);
            if eudi1<=eudi2
                part1=[part1 I];
                count1=count1+1;
                part1ad=part1ad+I;
            else
                part2=[part2 I];
                count2=count2+1;
                part2ad=part2ad+I;
            end
        end
        C2=part1ad./count1;
        C3=part2ad./count2;
        c4=C2+1;
        c5=C2-1;
        c6=C3+1;
        c7=C3-1;
        [m n]=size(part1);
        [x y]=size(c4);
        for aa1=0:x:n-x
            I=part1(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist3=0;
            dist4=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
                    dist3=dist3+d3;
                end
            end
            eudi3=sqrt(dist3);
            for i2=1:1:a1
                for j2=1:1:b1
                    d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
                    dist4=dist4+d4;
                end
            end
            eudi4=sqrt(dist4);
            if eudi3<=eudi4
                part3=[part3 I];
                count3=count3+1;
                part3ad=part3ad+I;
            else
                part4=[part4 I];
                count4=count4+1;
                part4ad=part4ad+I;
            end
        end
        C4=part3ad./count3;
        C5=part4ad./count4;
        
        [m n]=size(part2);
        [x y]=size(c6);
        for aa1=0:x:n-x
            I=part2(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist5=0;
            dist6=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
                    dist5=dist5+d5;
                end
            end
            eudi5=sqrt(dist5);
            for i2=1:1:a1
                for j2=1:1:b1
                    d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
                    dist6=dist6+d6;
                end
            end
            eudi6=sqrt(dist6);
            if eudi5<eudi6
                part5=[part5 I];
                count5=count5+1;
                part5ad=part5ad+I;
            else
                part6=[part6 I];
                count6=count6+1;
                part6ad=part6ad+I;
            end
        end
        C6=part5ad./count5;
        C7=part6ad./count6;
        codeword5=[C4 C5 C6 C7];
        codeword_signer5=[codeword_signer5 codeword5];
        xlswrite('signer5.xlsx',codeword_signer5);
    end
end
workingDir='E:\creation phrases\Signer6';
mkdir(workingDir);
mkdir(workingDir,'PROCESSED FRAMES');
mkdir(workingDir,'FRAMES');
vpath='E:\ISL DATABASE\Signer 6\phrases\training';
vformat='.wmv';
codeword_signer6=[];
for a=1:1:10
    for b=1:1:3
        part1=[];
        part2=[];
        part1ad=zeros(28,28);
        part2ad=zeros(28,28);
        count1=0;
        count2=0;
        part3=[];
        part4=[];
        part3ad=zeros(28,28);
        part4ad=zeros(28,28);
        count3=0;
        count4=0;
        part5=[];
        part6=[];
        part5ad=zeros(28,28);
        part6ad=zeros(28,28);
        count5=0;
        count6=0;
        A=[];
        imm1=zeros(28,28);
        prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
        video=VideoReader(strcat(prefix_video,vformat));
        n=video.NumberOfFrames;
        for i=1:1:n
            frame= read(video,i);
            imwrite(frame,fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
        end
        for i=1:1:n-2
            image1=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            image2=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
            img1=(imcrop(image1,[200,60,245,250]));
            img2=(imcrop(image2,[200,60,245,250]));
            i1=rgb2gray(img1);
            img3=img1-img2;
            t=0.2*mean2(i1);
            img4=t*img3;
            i4=im2bw(img4);
            img5=edge(i1,'canny');
            img6=and(i4,img5);
            cb=img1(:,:,2);
            cr=img1(:,:,3);
            cb2=[];
            cr2=[];
            [r c]=size(cb);
            for ii=1:r
                for j=1:c
                    if(cb(ii,j)>=77 && cb(ii,j)<=127)
                        cb2(ii,j)=cb(ii,j);
                    else
                        cb2(ii,j)=0;
                    end
                    if(cr(ii,j)>=134 && cr(ii,j)<=173)
                        cr2(ii,j)=cr(ii,j);
                    else
                        cr2(ii,j)=0;
                    end
                end
            end
            img7_6(:,:,2)=cb2;
            img7_6(:,:,3)=cr2;
            i7=im2bw(img7_6);
            i8=and(img6,i7);
            imwrite(i8,fullfile(workingDir,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            i_fft=fft2(i8);
            i_fftab=abs(i_fft);
            for xx=1:1:28
                for yy=1:1:28
                    i_disc(xx,yy)=i_fftab(xx,yy);
                    imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
                end
            end
            i_disc(1,1)=0;
            imm1(1,1)=0;
            A=[A i_disc];
        end
        c1=imm1./i;
        c2=c1+1;
        c3=c1-1;
        [x y]=size(i_disc);
        [m n]=size(A);
        for aa1=0:x:n-x
            I=A(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist1=0;
            dist2=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
                    dist1=dist1+d1;
                end
            end
            eudi1=sqrt(dist1);
            for i2=1:1:a1
                for j2=1:1:b1
                    d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
                    dist2=dist2+d2;
                end
            end
            eudi2=sqrt(dist2);
            if eudi1<=eudi2
                part1=[part1 I];
                count1=count1+1;
                part1ad=part1ad+I;
            else
                part2=[part2 I];
                count2=count2+1;
                part2ad=part2ad+I;
            end
        end
        C2=part1ad./count1;
        C3=part2ad./count2;
        c4=C2+1;
        c5=C2-1;
        c6=C3+1;
        c7=C3-1;
        [m n]=size(part1);
        [x y]=size(c4);
        for aa1=0:x:n-x
            I=part1(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist3=0;
            dist4=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
                    dist3=dist3+d3;
                end
            end
            eudi3=sqrt(dist3);
            for i2=1:1:a1
                for j2=1:1:b1
                    d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
                    dist4=dist4+d4;
                end
            end
            eudi4=sqrt(dist4);
            if eudi3<=eudi4
                part3=[part3 I];
                count3=count3+1;
                part3ad=part3ad+I;
            else
                part4=[part4 I];
                count4=count4+1;
                part4ad=part4ad+I;
            end
        end
        C4=part3ad./count3;
        C5=part4ad./count4;
        
        [m n]=size(part2);
        [x y]=size(c6);
        for aa1=0:x:n-x
            I=part2(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist5=0;
            dist6=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
                    dist5=dist5+d5;
                end
            end
            eudi5=sqrt(dist5);
            for i2=1:1:a1
                for j2=1:1:b1
                    d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
                    dist6=dist6+d6;
                end
            end
            eudi6=sqrt(dist6);
            if eudi5<eudi6
                part5=[part5 I];
                count5=count5+1;
                part5ad=part5ad+I;
            else
                part6=[part6 I];
                count6=count6+1;
                part6ad=part6ad+I;
            end
        end
        C6=part5ad./count5;
        C7=part6ad./count6;
        codeword6=[C4 C5 C6 C7];
        codeword_signer6=[codeword_signer6 codeword6];
        xlswrite('signer6.xlsx',codeword_signer6);
    end
end
workingDir='E:\creation phrases\Signer7';
mkdir(workingDir);
mkdir(workingDir,'PROCESSED FRAMES');
mkdir(workingDir,'FRAMES');
vpath='E:\ISL DATABASE\Signer 7\phrases\training';
vformat='.wmv';
codeword_signer7=[];
for a=1:1:10
    for b=1:1:3
        part1=[];
        part2=[];
        part1ad=zeros(28,28);
        part2ad=zeros(28,28);
        count1=0;
        count2=0;
        part3=[];
        part4=[];
        part3ad=zeros(28,28);
        part4ad=zeros(28,28);
        count3=0;
        count4=0;
        part5=[];
        part6=[];
        part5ad=zeros(28,28);
        part6ad=zeros(28,28);
        count5=0;
        count6=0;
        A=[];
        imm1=zeros(28,28);
        prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
        video=VideoReader(strcat(prefix_video,vformat));
        n=video.NumberOfFrames;
        for i=1:1:n
            frame= read(video,i);
            imwrite(frame,fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
        end
        for i=1:1:n-2
            image1=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            image2=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
            img1=(imcrop(image1,[200,60,245,250]));
            img2=(imcrop(image2,[200,60,245,250]));
            i1=rgb2gray(img1);
            img3=img1-img2;
            t=0.2*mean2(i1);
            img4=t*img3;
            i4=im2bw(img4);
            img5=edge(i1,'canny');
            img6=and(i4,img5);
            cb=img1(:,:,2);
            cr=img1(:,:,3);
            cb2=[];
            cr2=[];
            [r c]=size(cb);
            for ii=1:r
                for j=1:c
                    if(cb(ii,j)>=77 && cb(ii,j)<=127)
                        cb2(ii,j)=cb(ii,j);
                    else
                        cb2(ii,j)=0;
                    end
                    if(cr(ii,j)>=134 && cr(ii,j)<=173)
                        cr2(ii,j)=cr(ii,j);
                    else
                        cr2(ii,j)=0;
                    end
                end
            end
            img7_7(:,:,2)=cb2;
            img7_7(:,:,3)=cr2;
            i7=im2bw(img7_7);
            i8=and(img6,i7);
            imwrite(i8,fullfile(workingDir,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            i_fft=fft2(i8);
            i_fftab=abs(i_fft);
            for xx=1:1:28
                for yy=1:1:28
                    i_disc(xx,yy)=i_fftab(xx,yy);
                    imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
                end
            end
            i_disc(1,1)=0;
            imm1(1,1)=0;
            A=[A i_disc];
        end
        c1=imm1./i;
        c2=c1+1;
        c3=c1-1;
        [x y]=size(i_disc);
        [m n]=size(A);
        for aa1=0:x:n-x
            I=A(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist1=0;
            dist2=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
                    dist1=dist1+d1;
                end
            end
            eudi1=sqrt(dist1);
            for i2=1:1:a1
                for j2=1:1:b1
                    d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
                    dist2=dist2+d2;
                end
            end
            eudi2=sqrt(dist2);
            if eudi1<=eudi2
                part1=[part1 I];
                count1=count1+1;
                part1ad=part1ad+I;
            else
                part2=[part2 I];
                count2=count2+1;
                part2ad=part2ad+I;
            end
        end
        C2=part1ad./count1;
        C3=part2ad./count2;
        c4=C2+1;
        c5=C2-1;
        c6=C3+1;
        c7=C3-1;
        [m n]=size(part1);
        [x y]=size(c4);
        for aa1=0:x:n-x
            I=part1(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist3=0;
            dist4=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
                    dist3=dist3+d3;
                end
            end
            eudi3=sqrt(dist3);
            for i2=1:1:a1
                for j2=1:1:b1
                    d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
                    dist4=dist4+d4;
                end
            end
            eudi4=sqrt(dist4);
            if eudi3<=eudi4
                part3=[part3 I];
                count3=count3+1;
                part3ad=part3ad+I;
            else
                part4=[part4 I];
                count4=count4+1;
                part4ad=part4ad+I;
            end
        end
        C4=part3ad./count3;
        C5=part4ad./count4;
        
        [m n]=size(part2);
        [x y]=size(c6);
        for aa1=0:x:n-x
            I=part2(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist5=0;
            dist6=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
                    dist5=dist5+d5;
                end
            end
            eudi5=sqrt(dist5);
            for i2=1:1:a1
                for j2=1:1:b1
                    d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
                    dist6=dist6+d6;
                end
            end
            eudi6=sqrt(dist6);
            if eudi5<eudi6
                part5=[part5 I];
                count5=count5+1;
                part5ad=part5ad+I;
            else
                part6=[part6 I];
                count6=count6+1;
                part6ad=part6ad+I;
            end
        end
        C6=part5ad./count5;
        C7=part6ad./count6;
        codeword7=[C4 C5 C6 C7];
        codeword_signer7=[codeword_signer7 codeword7];
        xlswrite('signer7.xlsx',codeword_signer7);
    end
end
workingDir='E:\creation phrases\Signer8';
mkdir(workingDir);
mkdir(workingDir,'PROCESSED FRAMES');
mkdir(workingDir,'FRAMES');
vpath='E:\ISL DATABASE\Signer 8\phrases\training';
vformat='.wmv';
codeword_signer8=[];
for a=1:1:10
    for b=1:1:3
        part1=[];
        part2=[];
        part1ad=zeros(28,28);
        part2ad=zeros(28,28);
        count1=0;
        count2=0;
        part3=[];
        part4=[];
        part3ad=zeros(28,28);
        part4ad=zeros(28,28);
        count3=0;
        count4=0;
        part5=[];
        part6=[];
        part5ad=zeros(28,28);
        part6ad=zeros(28,28);
        count5=0;
        count6=0;
        A=[];
        imm1=zeros(28,28);
        prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
        video=VideoReader(strcat(prefix_video,vformat));
        n=video.NumberOfFrames;
        for i=1:1:n
            frame= read(video,i);
            imwrite(frame,fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
        end
        for i=1:1:n-2
            image1=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            image2=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
            img1=(imcrop(image1,[200,60,245,250]));
            img2=(imcrop(image2,[200,60,245,250]));
            i1=rgb2gray(img1);
            img3=img1-img2;
            t=0.2*mean2(i1);
            img4=t*img3;
            i4=im2bw(img4);
            img5=edge(i1,'canny');
            img6=and(i4,img5);
            cb=img1(:,:,2);
            cr=img1(:,:,3);
            cb2=[];
            cr2=[];
            [r c]=size(cb);
            for ii=1:r
                for j=1:c
                    if(cb(ii,j)>=77 && cb(ii,j)<=127)
                        cb2(ii,j)=cb(ii,j);
                    else
                        cb2(ii,j)=0;
                    end
                    if(cr(ii,j)>=134 && cr(ii,j)<=173)
                        cr2(ii,j)=cr(ii,j);
                    else
                        cr2(ii,j)=0;
                    end
                end
            end
            img7_8(:,:,2)=cb2;
            img7_8(:,:,3)=cr2;
            i7=im2bw(img7_8);
            i8=and(img6,i7);
            imwrite(i8,fullfile(workingDir,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            i_fft=fft2(i8);
            i_fftab=abs(i_fft);
            for xx=1:1:28
                for yy=1:1:28
                    i_disc(xx,yy)=i_fftab(xx,yy);
                    imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
                end
            end
            i_disc(1,1)=0;
            imm1(1,1)=0;
            A=[A i_disc];
        end
        c1=imm1./i;
        c2=c1+1;
        c3=c1-1;
        [x y]=size(i_disc);
        [m n]=size(A);
        for aa1=0:x:n-x
            I=A(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist1=0;
            dist2=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
                    dist1=dist1+d1;
                end
            end
            eudi1=sqrt(dist1);
            for i2=1:1:a1
                for j2=1:1:b1
                    d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
                    dist2=dist2+d2;
                end
            end
            eudi2=sqrt(dist2);
            if eudi1<=eudi2
                part1=[part1 I];
                count1=count1+1;
                part1ad=part1ad+I;
            else
                part2=[part2 I];
                count2=count2+1;
                part2ad=part2ad+I;
            end
        end
        C2=part1ad./count1;
        C3=part2ad./count2;
        c4=C2+1;
        c5=C2-1;
        c6=C3+1;
        c7=C3-1;
        [m n]=size(part1);
        [x y]=size(c4);
        for aa1=0:x:n-x
            I=part1(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist3=0;
            dist4=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
                    dist3=dist3+d3;
                end
            end
            eudi3=sqrt(dist3);
            for i2=1:1:a1
                for j2=1:1:b1
                    d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
                    dist4=dist4+d4;
                end
            end
            eudi4=sqrt(dist4);
            if eudi3<=eudi4
                part3=[part3 I];
                count3=count3+1;
                part3ad=part3ad+I;
            else
                part4=[part4 I];
                count4=count4+1;
                part4ad=part4ad+I;
            end
        end
        C4=part3ad./count3;
        C5=part4ad./count4;
        
        [m n]=size(part2);
        [x y]=size(c6);
        for aa1=0:x:n-x
            I=part2(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist5=0;
            dist6=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
                    dist5=dist5+d5;
                end
            end
            eudi5=sqrt(dist5);
            for i2=1:1:a1
                for j2=1:1:b1
                    d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
                    dist6=dist6+d6;
                end
            end
            eudi6=sqrt(dist6);
            if eudi5<eudi6
                part5=[part5 I];
                count5=count5+1;
                part5ad=part5ad+I;
            else
                part6=[part6 I];
                count6=count6+1;
                part6ad=part6ad+I;
            end
        end
        C6=part5ad./count5;
        C7=part6ad./count6;
        codeword8=[C4 C5 C6 C7];
        codeword_signer8=[codeword_signer8 codeword8];
        xlswrite('signer8.xlsx',codeword_signer8);
    end
end
workingDir='E:\creation phrases\Signer9';
mkdir(workingDir);
mkdir(workingDir,'PROCESSED FRAMES');
mkdir(workingDir,'FRAMES');
vpath='E:\ISL DATABASE\Signer 9\phrases\training';
vformat='.wmv';
codeword_signer9=[];
for a=1:1:10
    for b=1:1:3
        part1=[];
        part2=[];
        part1ad=zeros(28,28);
        part2ad=zeros(28,28);
        count1=0;
        count2=0;
        part3=[];
        part4=[];
        part3ad=zeros(28,28);
        part4ad=zeros(28,28);
        count3=0;
        count4=0;
        part5=[];
        part6=[];
        part5ad=zeros(28,28);
        part6ad=zeros(28,28);
        count5=0;
        count6=0;
        A=[];
        imm1=zeros(28,28);
        prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
        video=VideoReader(strcat(prefix_video,vformat));
        n=video.NumberOfFrames;
        for i=1:1:n
            frame= read(video,i);
            imwrite(frame,fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
        end
        for i=1:1:n-2
            image1=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            image2=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
            img1=(imcrop(image1,[200,60,245,250]));
            img2=(imcrop(image2,[200,60,245,250]));
            i1=rgb2gray(img1);
            img3=img1-img2;
            t=0.2*mean2(i1);
            img4=t*img3;
            i4=im2bw(img4);
            img5=edge(i1,'canny');
            img6=and(i4,img5);
            cb=img1(:,:,2);
            cr=img1(:,:,3);
            cb2=[];
            cr2=[];
            [r c]=size(cb);
            for ii=1:r
                for j=1:c
                    if(cb(ii,j)>=77 && cb(ii,j)<=127)
                        cb2(ii,j)=cb(ii,j);
                    else
                        cb2(ii,j)=0;
                    end
                    if(cr(ii,j)>=134 && cr(ii,j)<=173)
                        cr2(ii,j)=cr(ii,j);
                    else
                        cr2(ii,j)=0;
                    end
                end
            end
            img7_9(:,:,2)=cb2;
            img7_9(:,:,3)=cr2;
            i7=im2bw(img7_9);
            i8=and(img6,i7);
            imwrite(i8,fullfile(workingDir,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            i_fft=fft2(i8);
            i_fftab=abs(i_fft);
            for xx=1:1:28
                for yy=1:1:28
                    i_disc(xx,yy)=i_fftab(xx,yy);
                    imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
                end
            end
            i_disc(1,1)=0;
            imm1(1,1)=0;
            A=[A i_disc];
        end
        c1=imm1./i;
        c2=c1+1;
        c3=c1-1;
        [x y]=size(i_disc);
        [m n]=size(A);
        for aa1=0:x:n-x
            I=A(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist1=0;
            dist2=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
                    dist1=dist1+d1;
                end
            end
            eudi1=sqrt(dist1);
            for i2=1:1:a1
                for j2=1:1:b1
                    d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
                    dist2=dist2+d2;
                end
            end
            eudi2=sqrt(dist2);
            if eudi1<=eudi2
                part1=[part1 I];
                count1=count1+1;
                part1ad=part1ad+I;
            else
                part2=[part2 I];
                count2=count2+1;
                part2ad=part2ad+I;
            end
        end
        C2=part1ad./count1;
        C3=part2ad./count2;
        c4=C2+1;
        c5=C2-1;
        c6=C3+1;
        c7=C3-1;
        [m n]=size(part1);
        [x y]=size(c4);
        for aa1=0:x:n-x
            I=part1(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist3=0;
            dist4=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
                    dist3=dist3+d3;
                end
            end
            eudi3=sqrt(dist3);
            for i2=1:1:a1
                for j2=1:1:b1
                    d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
                    dist4=dist4+d4;
                end
            end
            eudi4=sqrt(dist4);
            if eudi3<=eudi4
                part3=[part3 I];
                count3=count3+1;
                part3ad=part3ad+I;
            else
                part4=[part4 I];
                count4=count4+1;
                part4ad=part4ad+I;
            end
        end
        C4=part3ad./count3;
        C5=part4ad./count4;
        
        [m n]=size(part2);
        [x y]=size(c6);
        for aa1=0:x:n-x
            I=part2(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist5=0;
            dist6=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
                    dist5=dist5+d5;
                end
            end
            eudi5=sqrt(dist5);
            for i2=1:1:a1
                for j2=1:1:b1
                    d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
                    dist6=dist6+d6;
                end
            end
            eudi6=sqrt(dist6);
            if eudi5<eudi6
                part5=[part5 I];
                count5=count5+1;
                part5ad=part5ad+I;
            else
                part6=[part6 I];
                count6=count6+1;
                part6ad=part6ad+I;
            end
        end
        C6=part5ad./count5;
        C7=part6ad./count6;
        codeword9=[C4 C5 C6 C7];
        codeword_signer9=[codeword_signer9 codeword9];
        xlswrite('signer9.xlsx',codeword_signer9);
    end
end
workingDir='E:\creation phrases\Signer10';
mkdir(workingDir);
mkdir(workingDir,'PROCESSED FRAMES');
mkdir(workingDir,'FRAMES');
vpath='E:\ISL DATABASE\Signer 10\phrases\training';
vformat='.wmv';
codeword_signer10=[];
for a=1:1:10
    for b=1:1:3
        part1=[];
        part2=[];
        part1ad=zeros(28,28);
        part2ad=zeros(28,28);
        count1=0;
        count2=0;
        part3=[];
        part4=[];
        part3ad=zeros(28,28);
        part4ad=zeros(28,28);
        count3=0;
        count4=0;
        part5=[];
        part6=[];
        part5ad=zeros(28,28);
        part6ad=zeros(28,28);
        count5=0;
        count6=0;
        A=[];
        imm1=zeros(28,28);
        prefix_video=fullfile(vpath,sprintf('%d_iteration%d',a,b));
        video=VideoReader(strcat(prefix_video,vformat));
        n=video.NumberOfFrames;
        for i=1:1:n
            frame= read(video,i);
            imwrite(frame,fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
        end
        for i=1:1:n-2
            image1=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            image2=imread(fullfile(workingDir,'FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i+1)));
            img1=(imcrop(image1,[200,80,355,360]));
            img2=(imcrop(image2,[200,80,355,360]));
            i1=rgb2gray(img1);
            img3=img1-img2;
            t=0.2*mean2(i1);
            img4=t*img3;
            i4=im2bw(img4);
            img5=edge(i1,'canny');
            img6=and(i4,img5);
            cb=img1(:,:,2);
            cr=img1(:,:,3);
            cb2=[];
            cr2=[];
            [r c]=size(cb);
            for ii=1:r
                for j=1:c
                    if(cb(ii,j)>=77 && cb(ii,j)<=127)
                        cb2(ii,j)=cb(ii,j);
                    else
                        cb2(ii,j)=0;
                    end
                    if(cr(ii,j)>=134 && cr(ii,j)<=173)
                        cr2(ii,j)=cr(ii,j);
                    else
                        cr2(ii,j)=0;
                    end
                end
            end
            img7_10(:,:,2)=cb2;
            img7_10(:,:,3)=cr2;
            i7=im2bw(img7_10);
            i8=and(img6,i7);
            imwrite(i8,fullfile(workingDir,'PROCESSED FRAMES',sprintf('%d_image_%d_%d.jpg',b,a,i)));
            i_fft=fft2(i8);
            i_fftab=abs(i_fft);
            for xx=1:1:28
                for yy=1:1:28
                    i_disc(xx,yy)=i_fftab(xx,yy);
                    imm1(xx,yy)=imm1(xx,yy)+i_disc(xx,yy);
                end
            end
            i_disc(1,1)=0;
            imm1(1,1)=0;
            A=[A i_disc];
        end
        c1=imm1./i;
        c2=c1+1;
        c3=c1-1;
        [x y]=size(i_disc);
        [m n]=size(A);
        for aa1=0:x:n-x
            I=A(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist1=0;
            dist2=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d1=(c2(i2,j2)-I(i2,j2))*(c2(i2,j2)-I(i2,j2));
                    dist1=dist1+d1;
                end
            end
            eudi1=sqrt(dist1);
            for i2=1:1:a1
                for j2=1:1:b1
                    d2=(c3(i2,j2)-I(i2,j2))*(c3(i2,j2)-I(i2,j2));
                    dist2=dist2+d2;
                end
            end
            eudi2=sqrt(dist2);
            if eudi1<=eudi2
                part1=[part1 I];
                count1=count1+1;
                part1ad=part1ad+I;
            else
                part2=[part2 I];
                count2=count2+1;
                part2ad=part2ad+I;
            end
        end
        C2=part1ad./count1;
        C3=part2ad./count2;
        c4=C2+1;
        c5=C2-1;
        c6=C3+1;
        c7=C3-1;
        [m n]=size(part1);
        [x y]=size(c4);
        for aa1=0:x:n-x
            I=part1(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist3=0;
            dist4=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d3=(c4(i2,j2)-I(i2,j2))*(c4(i2,j2)-I(i2,j2));
                    dist3=dist3+d3;
                end
            end
            eudi3=sqrt(dist3);
            for i2=1:1:a1
                for j2=1:1:b1
                    d4=(c5(i2,j2)-I(i2,j2))*(c5(i2,j2)-I(i2,j2));
                    dist4=dist4+d4;
                end
            end
            eudi4=sqrt(dist4);
            if eudi3<=eudi4
                part3=[part3 I];
                count3=count3+1;
                part3ad=part3ad+I;
            else
                part4=[part4 I];
                count4=count4+1;
                part4ad=part4ad+I;
            end
        end
        C4=part3ad./count3;
        C5=part4ad./count4;
        
        [m n]=size(part2);
        [x y]=size(c6);
        for aa1=0:x:n-x
            I=part2(:,aa1+1:aa1+x);
            [a1 b1]=size(I);
            dist5=0;
            dist6=0;
            for i2=1:1:a1
                for j2=1:1:b1
                    d5=(c6(i2,j2)-I(i2,j2))*(c6(i2,j2)-I(i2,j2));
                    dist5=dist5+d5;
                end
            end
            eudi5=sqrt(dist5);
            for i2=1:1:a1
                for j2=1:1:b1
                    d6=(c7(i2,j2)-I(i2,j2))*(c7(i2,j2)-I(i2,j2));
                    dist6=dist6+d6;
                end
            end
            eudi6=sqrt(dist6);
            if eudi5<eudi6
                part5=[part5 I];
                count5=count5+1;
                part5ad=part5ad+I;
            else
                part6=[part6 I];
                count6=count6+1;
                part6ad=part6ad+I;
            end
        end
        C6=part5ad./count5;
        C7=part6ad./count6;
        codeword10=[C4 C5 C6 C7];
        codeword_signer10=[codeword_signer10 codeword10];
        xlswrite('signer10.xlsx',codeword_signer10);
    end
end