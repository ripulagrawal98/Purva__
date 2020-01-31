clc;
clear all;
s1codeword=xlsread('E:\Final Programs\phrases\signer1.xlsx');
s2codeword=xlsread('E:\Final Programs\phrases\signer2.xlsx');
s3codeword=xlsread('E:\Final Programs\phrases\signer3.xlsx');
s4codeword=xlsread('E:\Final Programs\phrases\signer4.xlsx');
s5codeword=xlsread('E:\Final Programs\phrases\signer5.xlsx');
s6codeword=xlsread('E:\Final Programs\phrases\signer6.xlsx');
s7codeword=xlsread('E:\Final Programs\phrases\signer7.xlsx');
s8codeword=xlsread('E:\Final Programs\phrases\signer8.xlsx');
s9codeword=xlsread('E:\Final Programs\phrases\signer9.xlsx');
s10codeword=xlsread('E:\Final Programs\phrases\signer10.xlsx');
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
workingDir=tempname;
mkdir(workingDir);
mkdir(workingDir,'FRAMES');
vpath='E:\ISL DATABASE\Signer 10\phrases\testing\iteration 4\9';
vformat='.wmv';
testvideo=VideoReader(strcat(vpath,vformat));
n=testvideo.NumberOfFrames;
for i=1:1:n
    frame=read(testvideo,i);
    imwrite(frame,fullfile(workingDir,'FRAMES',sprintf('image_%d.jpg',i)));
end
for i=1:1:n-2
    image1=imread(fullfile(workingDir,'FRAMES',sprintf('image_%d.jpg',i)));
    image2=imread(fullfile(workingDir,'FRAMES',sprintf('image_%d.jpg',i+1)));
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
    img7_1(:,:,2)=cb2;
    img7_1(:,:,3)=cr2;
    i7=im2bw(img7_1);
    i8=and(img6,i7);
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
codeword=[C4 C5 C6 C7];
distance1=[];
[row col]=size(codeword);
[M N]=size(s1codeword);
for i3=0:col:N-col
    vector1=s1codeword(:,i3+1:i3+col);
    [aa bb]=size(vector1);
    dist1=0;
    for i=1:1:aa
        for j=1:1:bb
            d1=(codeword(i,j)-vector1(i,j))*(codeword(i,j)-vector1(i,j));
            dist1=dist1+d1;
        end
    end
    eudi1=sqrt(dist1);
    distance1=[distance1;eudi1];
end
ans1=min(distance1);
for a=1:1:30
    if distance1(a)==ans1
        index1=a;
    end
end

distance2=[];
[row col]=size(codeword);
[M N]=size(s2codeword);
for i3=0:col:N-col
    vector2=s2codeword(:,i3+1:i3+col);
    [aa bb]=size(vector2);
    dist2=0;
    for i=1:1:aa
        for j=1:1:bb
            d2=(codeword(i,j)-vector2(i,j))*(codeword(i,j)-vector2(i,j));
            dist2=dist2+d2;
        end
    end
    eudi2=sqrt(dist2);
    distance2=[distance2;eudi2];
end
ans2=min(distance2);
for a=1:1:30
    if distance2(a)==ans2
        index2=a;
    end
end
distance3=[];
[row col]=size(codeword);
[M N]=size(s3codeword);
for i3=0:col:N-col
    vector3=s3codeword(:,i3+1:i3+col);
    [aa bb]=size(vector3);
    dist3=0;
    for i=1:1:aa
        for j=1:1:bb
            d3=(codeword(i,j)-vector3(i,j))*(codeword(i,j)-vector3(i,j));
            dist3=dist3+d3;
        end
    end
    eudi3=sqrt(dist3);
    distance3=[distance3;eudi3];
end
ans3=min(distance3);
for a=1:1:30
    if distance3(a)==ans3
        index3=a;
    end
end
distance4=[];
[row col]=size(codeword);
[M N]=size(s4codeword);
for i3=0:col:N-col
    vector4=s4codeword(:,i3+1:i3+col);
    [aa bb]=size(vector4);
    dist4=0;
    for i=1:1:aa
        for j=1:1:bb
            d4=(codeword(i,j)-vector4(i,j))*(codeword(i,j)-vector4(i,j));
            dist4=dist4+d4;
        end
    end
    eudi4=sqrt(dist4);
    distance4=[distance4;eudi4];
end
ans4=min(distance4);
for a=1:1:30
    if distance4(a)==ans4
        index4=a;
    end
end
distance5=[];
[row col]=size(codeword);
[M N]=size(s5codeword);
for i3=0:col:N-col
    vector5=s5codeword(:,i3+1:i3+col);
    [aa bb]=size(vector5);
    dist5=0;
    for i=1:1:aa
        for j=1:1:bb
            d5=(codeword(i,j)-vector5(i,j))*(codeword(i,j)-vector5(i,j));
            dist5=dist5+d5;
        end
    end
    eudi5=sqrt(dist5);
    distance5=[distance5;eudi5];
end
ans5=min(distance5);
for a=1:1:30
    if distance5(a)==ans5
        index5=a;
    end
end
distance6=[];
[row col]=size(codeword);
[M N]=size(s6codeword);
for i3=0:col:N-col
    vector6=s6codeword(:,i3+1:i3+col);
    [aa bb]=size(vector6);
    dist6=0;
    for i=1:1:aa
        for j=1:1:bb
            d6=(codeword(i,j)-vector6(i,j))*(codeword(i,j)-vector6(i,j));
            dist6=dist6+d6;
        end
    end
    eudi6=sqrt(dist6);
    distance6=[distance6;eudi6];
end
ans6=min(distance6);
for a=1:1:30
    if distance6(a)==ans6
        index6=a;
    end
end
distance7=[];
[row col]=size(codeword);
[M N]=size(s7codeword);
for i3=0:col:N-col
    vector7=s7codeword(:,i3+1:i3+col);
    [aa bb]=size(vector7);
    dist7=0;
    for i=1:1:aa
        for j=1:1:bb
            d7=(codeword(i,j)-vector7(i,j))*(codeword(i,j)-vector7(i,j));
            dist7=dist7+d7;
        end
    end
    eudi7=sqrt(dist7);
    distance7=[distance7;eudi7];
end
ans7=min(distance7);
for a=1:1:30
    if distance7(a)==ans7
        index7=a;
    end
end
distance8=[];
[row col]=size(codeword);
[M N]=size(s8codeword);
for i3=0:col:N-col
    vector8=s8codeword(:,i3+1:i3+col);
    [aa bb]=size(vector8);
    dist8=0;
    for i=1:1:aa
        for j=1:1:bb
            d8=(codeword(i,j)-vector8(i,j))*(codeword(i,j)-vector8(i,j));
            dist8=dist8+d8;
        end
    end
    eudi8=sqrt(dist8);
    distance8=[distance8;eudi8];
end
ans8=min(distance8);
for a=1:1:30
    if distance8(a)==ans8
        index8=a;
    end
end
distance9=[];
[row col]=size(codeword);
[M N]=size(s9codeword);
for i3=0:col:N-col
    vector9=s9codeword(:,i3+1:i3+col);
    [aa bb]=size(vector9);
    dist9=0;
    for i=1:1:aa
        for j=1:1:bb
            d9=(codeword(i,j)-vector9(i,j))*(codeword(i,j)-vector9(i,j));
            dist9=dist9+d9;
        end
    end
    eudi9=sqrt(dist9);
    distance9=[distance9;eudi9];
end
ans9=min(distance9);
for a=1:1:30
    if distance9(a)==ans9
        index9=a;
    end
end
distance10=[];
[row col]=size(codeword);
[M N]=size(s10codeword);
for i3=0:col:N-col
    vector10=s10codeword(:,i3+1:i3+col);
    [aa bb]=size(vector10);
    dist10=0;
    for i=1:1:aa
        for j=1:1:bb
            d10=(codeword(i,j)-vector10(i,j))*(codeword(i,j)-vector10(i,j));
            dist10=dist10+d10;
        end
    end
    eudi10=sqrt(dist10);
    distance10=[distance10;eudi10];
end
ans10=min(distance10);
for a=1:1:30
    if distance10(a)==ans10
        index10=a;
    end
end
indices=[index1 index2 index3 index4 index5 index6 index7 index8 index9 index10];
ans=[ans1 ans2 ans3 ans4 ans5 ans6 ans7 ans8 ans9 ans10];
final=min(ans);
for a=1:1:10
    if ans(a)==final
        signer_index=a;
        disp(sprintf('Signer is %d',a));
        if indices(a)<=3
            disp('sign made is INDIA');
        end
        
        if indices(a)>=4&& indices(a)<=6
            disp('sign made is HELLO');
        end
        
        if indices(a)>=7&& indices(a)<=9
            disp('sign made is NAMASTE');
        end
        
        if indices(a)>=10&& indices(a)<=12
            disp('sign made is THANK YOU');
        end
        
        if indices(a)>=13&& indices(a)<=15
            disp('sign made is SORRY');
        end
        
        if indices(a)>=16&& indices(a)<=18
            disp('sign made is PLEASE');
        end
        
        if indices(a)>=19&& indices(a)<=21
            disp('sign made is FIRE');
        end
        
        if indices(a)>=22&& indices(a)<=24
            disp('sign made is DANGER');
        end
        
        if indices(a)>=25&& indices(a)<=27
            disp('sign made is HELP ME');
        end
        
        if indices(a)>=28&& indices(a)<=30
            disp('sign made is I AM HUNGRY');
            
        end
    end
end
