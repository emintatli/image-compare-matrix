A=imread('c:/matlab/3_180.jpg'); % incecelenek olan baskı kartının resmi
 A2=A
 ana=imread('c:/matlab/1.jpg'); % baskı kartının kusursuz bir resimi
 ana2=ana
 %açı ayarlama ------
 acipp=0; %0 dereceden başlaması için değişkene değer atıyorum
 Dtt=8551 %testler yaparak iki resmi açısal olarak karşılaştırırken
olması gereken maksimum eşleşmeyen pixel sayısı
 kkx=0;
 while Dtt >8550 %while döngüsü ile Dtt değişkeni istenen pixel fark
sayısına ulaşana kadar döngüye sokuldu
 A(:,:,1) = 0; %kırmızı renk daha rahat işlem yapılması adına resim
matrisinden silindi
 B=mat2gray(A); %resim üzerinde daha rahat işlem yapılması adına
'grayscale' olarak değiştirildi
 C=im2bw(B, 0.042); %resim grayscale den testler sonucunda oluşturulan
bir sayı üzerinden yuvarlamalar yapılarak binary resmi olarak kayıt edildi
 Sayi1 = bwboundaries(C); %büyük pikselli kusurların bölgelerinin
sınırları tespit edildi
 Sayison1 = size(Sayi1, 12);
 grafikf{1}=round(Sayison1);
 C = bwareaopen(C, 1); %resim üzerindeki gözardı edilebilecek kısımları
silmek amacı ile 20 pikselden küçük olan bölgeler silindi
 ana(:,:,1) = 0; %yapılan işlemlerin aynısı kusursuz resim içinde
yapıldı
 Bana=mat2gray(ana);
 Cana=im2bw(Bana, 0.042);
 C = imrotate(C,acipp,'crop'); %kusurlu resim while döngüsü bitene
kadar ayarlanan acipp değişkeni kadar açısal olarak ötelenir
 figure(1)
 imshow(C)


 kkx=kkx+1;
 Dttx=Dtt
 grafik1{kkx}=round(Dttx);
 grafik2{kkx}=acipp;
 D=imcrop(C,[0 0 270 270]); %matrisler üzerinde işlemler
yapılabilmesi için satır sütun sayılarının eşit olması gerekmekte bu
nedenle kırpmalar yapıldı
 Dana=imcrop(Cana,[0 0 270 270]);
 Dt=(Dana-D); %iki işlenmiş resim matrisi birbirinden çıkarıldı
 Dtt=sum(Dt(:)==1); %matrisdeki tüm değerlerin toplamları alındı
 acipp=acipp+5; %açı değişkeni istenilen değer kadar arttırıldı
 Dtt
 end
 if kkx>2
 figure(2)
 hold on
 kk=1;

 for kk = 2 : kkx
 kk
 grdeger=[grafik1{kk}]
 grdeger2=[grafik2{kk}]
 plot(grdeger2,grdeger,'-x') % açı farkı kontrolü algoritmasının
nasıl işlediği ile ilgili grafik
 xlabel('Açı');
 ylabel('Toplam Farklı Pixel') ;
end
 end



 hold off
 Sayi2 = bwboundaries(Dt); %büyük pikselli kusurların bölgelerinin
sınırları tespit edildi
 Sayison2 = size(Sayi2, 1);
 grafikf{2}=round(Sayison1);
 Dt = bwareaopen(Dt, 2); %resim üzerindeki fark alırken oluşan
parazitleri silmek amacı ile 20 pikselden küçük olan bölgeler silindi
 figure(3)
 imshow(Dt)

 acipp=acipp-5 %daha sonra kullanılabilmek için kaç derece sonra
resimlerin istenilen eşleşmeyi verdiğini belirledim
 Dtt
 %-----kusurlu bölgenin bulunması
 figure(4)
 imshow(C);
 D=sum(C(:));
 ana(:,:,1) = 0;
 Bana=mat2gray(ana);
 Cana=im2bw(Bana, 0.042);
 Fark=Cana-C; %döndürülmüş resim ile kusursuz resim matrisi çıkarıldı
 imshow(Fark);

 Sil = Fark <0;
 Fark(Sil) = 0; %çıkarma işlemi sırasında oluşan anlamsız -1 değerleri
silindi
 imshow(Fark);

 Fark = bwareaopen(Fark, 20); %resim üzerindeki gözardı edilebilecek
kısımları silmek amacı ile 20 pikselden küçük olan bölgeler silindi
 TopPix=sum(Fark(:)); %toplam kusurlu piksel sayısı alındı
 imshow(Fark);

 Beyaz = Fark(:,:, 1) == 1;
 

 Beyaz = bwareafilt(Beyaz, 10); %10 pikselden büyük kusurlar bölge
olarak değişkene kayıt edildi
 Sayi = bwboundaries(Beyaz); %büyük pikselli kusurların bölgelerinin
sınırları tespit edildi
 Sayison = size(Sayi, 1); %toplam kusurlu bölge sayısı alındı
 grafikf{3}=round(Sayison);
 hold on; %üst üste çizim yapmak için ayar yapıldı
 bolge=0;
 xt=0;
 for k = 1 : Sayison %toplam kusurlu bölge sayısı kadar for döngüsü
açıldı
 sonMx = Sayi{k};
 x = sonMx(:,2);
 y = sonMx(:,1);
 bolge=bolge+1;
 plot(x, y, 'g', 'LineWidth', 2); % plot komutu ile kusurlu
bölgenin etrafında yeşil bir çizim yapıldı
 end
 [y, x] = find(Fark > 0); % tüm kusurlu piksellerin kordinatları bir
matrise kayıt edildi
 xt=mean2(x);
 yt=mean2(y); % bu matrisin ortalaması alındı
 xt=round(xt)
 yt=round(yt)
 merkez = [xt,yt]; % ortalama kordinatlar değişkene atandı
 yline(yt,'b');
 xline(xt,'b'); % x ve y doğruları üzerinde x=ort,y=0 ve x=0 y=ort
şeklindeki bölgelerin çizimleri yapıldı
 xs=size(x)
 ys=size(y)
 alanboyut=(xs+ys)/50
 alanboyut=round(mean2(alanboyut)) %tahmini kusurlu alanın bölgesi
alındı
 kesilcek=imcrop(ana2,[xt yt alanboyut alanboyut]) %kusurlu bölgenin
alanı kırpıldı
 title(['Kusurlu Bolge Ortalama Kordinat:',num2str(xt),',',num2str(yt)])
%plot komutu ile ortalama bölgenin koordinatları ve bulunduğu kısım
çizdirildi
 %------ yeni resim çekilcek
 lazres1=imread('c:/matlab/isik2.jpg'); %kusurlu bölgeye lazer ışını
gönderiliyorken çekilen fotoğraf yüklendi
 paranaliz1=mat2gray(lazres1);
 paranaliz2=mean2(paranaliz1) %parlaklık değeri için resim matrisinin
ortalaması alınıyor

 %----parlaklık analizi
 if paranaliz2<0.6
 f = msgbox('soğuk lehimleme var'); % parlaklık belirlenen değerden
düşükse kusur algılanıyor
 %--bolge analiz
 else if bolge>5
 T=imcrop(lazres1,[35 35 50 50]); %parlaklık kusuru yok ise bölgesel
kusur analizi için resim kırpılıyor
 R = T(:,:,1); %resim rgb olarak yüklendiğinden resim 3 matrise
ayrılıyor
 G = T(:,:,2);
 B = T(:,:,3);
 RO=mean2(R) %her matrisin ortalamaları alınıyor
 GO=mean2(G)
 BO=mean2(B)
 if GO>RO && BO>RO %ayrılan matrisler birbirleri ile karşılaştırılıyor
 f = msgbox('Sol üst uzayda şekil kusuru var');
 else if RO>GO && BO>GO
 f = msgbox('Sağ üst uzayda şekil kusuru var');
 else if RO>BO && GO>BO
 f = msgbox('Alt uzayda şekil kusuru var');
 end
 end
 end
 else
 f = msgbox('Kusur yok');
 end
 end