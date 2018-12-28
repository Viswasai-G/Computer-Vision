w=load_database();
ri=round(400*rand(1,1));            
r=w(:,ri);                          
v=w(:,[1:ri-1 ri+1:end]);           
N=20;                               

O=uint8(ones(1,size(v,2))); 
m=uint8(mean(v,2));                 
vzm=v-uint8(single(m)*single(O));   

L=single(vzm)'*single(vzm);
[V,D]=eig(L);
V=single(vzm)*V;
V=V(:,end:-1:end-(N-1));            

cv=zeros(size(v,2),N);
for i=1:size(v,2);
    cv(i,:)=single(vzm(:,i))'*V;    
end

subplot(121); 
imshow(reshape(r,112,92));title('Query Face','FontWeight','bold','Fontsize',16,'color','black');


subplot(122);
p=r-m;                              
s=single(p)'*V;
z=[];
for i=1:size(v,2)
    z=[z,norm(cv(i,:)-s,2)];
    if(rem(i,20)==0),imshow(reshape(v(:,i),112,92)),end;
    drawnow;
end
[a,i]=min(z);
fin = reshape(v(:,i),112,92);

subplot(122);
imshow(fin);title('Matched Face','FontWeight','bold','Fontsize',16,'color','Black');
