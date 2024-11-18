CREATE TABLE jurusan(id_jurusan character(3) primary key not null, name_jurusan varchar(50) not null);
INSERT INTO jurusan VALUES('111','Teknologi Hasil Pertanian');
INSERT INTO jurusan VALUES('112','Sosial Ekonomi Pertanian');
INSERT INTO jurusan VALUES('113','Teknologi Mesin Pertanian');

CREATE TABLE dosen(nip character(7) primary key not null, name_dosen varchar(50) not null,id_jurusan character(3), foreign key(id_jurusan) references jurusan(id_jurusan));
INSERT INTO dosen VALUES('D111101','Ir. Satro','111');
INSERT INTO dosen VALUES('D111201','Ir. Sairi','112');
INSERT INTO dosen VALUES('D111301','Ir. Sarbini','113');
INSERT INTO dosen VALUES('D111102','Ir. Wahiji','111');

CREATE TABLE mahasiswa(nim character(7) primary key not null, name_mahasiswa varchar(50) not null, alamat text(100),id_jurusan varchar(3), foreign key(id_jurusan) references jurusan(id_jurusan));
INSERT INTO mahasiswa VALUES('2411101','muksin','jl. waringin kurung no.60 serang banten','111');
INSERT INTO mahasiswa VALUES('2411201','hilmi','jl. soekarno Hatta no. 1 bandung','112'); 
INSERT INTO mahasiswa VALUES('2411301','ramdani','jl. soekarno Hatta no. 3 lampung','113');

CREATE TABLE mata_kuliah(id_mata_kuliah character(4) primary key not null, name_mata_kuliah varchar(50), sks integer(1));
INSERT INTO mata_kuliah VALUES('IP01','Ilmu pangan', '2');
INSERT INTO mata_kuliah VALUES('TS01','Teknologi sayur', '3');
INSERT INTO mata_kuliah VALUES('MF01','Mekanika fluida', '2');
INSERT INTO mata_kuliah VALUES('PA01','pengantar agribisnis', '2');

CREATE TABLE mengajar(nomor integer primary key autoincrement, nip character(7) not null, id_mata_kuliah character(4) not null, foreign key (nip) references dosen (nip), foreign key (id_mata_kuliah) references mata_kuliah(id_mata_kuliah));
INSERT INTO mengajar (nip, id_mata_kuliah) VALUES('D111101','IP01');
INSERT INTO mengajar (nip, id_mata_kuliah) VALUES('D111102','TS01');
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D111201','PA01');
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D111301','MF01');

CREATE TABLE belajar(nomor integer primary key autoincrement, nim character(7) not null, id_mata_kuliah character(4) not null, nilai character(2),foreign key (nim) references mahasiswa (nim), foreign key (id_mata_kuliah) references mata_kuliah(id_mata_kuliah));
INSERT INTO belajar (nim, id_mata_kuliah)VALUES('2411101','IP01');
INSERT INTO belajar (nim, id_mata_kuliah)VALUES('2411102','TS01');
INSERT INTO belajar (nim, id_mata_kuliah)VALUES('2411201','PA01');
INSERT INTO belajar (nim, id_mata_kuliah)VALUES('2411301','MF01');


.header on
.mode column
select*from mahasiswa;
select*from jurusan;
select*from dosen;
select*from mata_kuliah;
select*from belajar;
select*from mengajar;

--untuk menampilkan eluruh data mahasiswa besrta nama jurusannya(task 1)
select*from mahasiswa cross join jurusan using(id_jurusan);
-- task2
ALTER TABLE mahasiswa ADD COLUMN umur integer(2);
UPDATE mahasiswa SET umur = 25 WHERE nim ='2411101';
UPDATE mahasiswa SET umur = 18 WHERE nim ='2411201';
UPDATE mahasiswa SET umur = 16 WHERE nim ='2411301';
--memunculkan mahasiswa yang berumur dibawah 20 tahun
select*from mahasiswa group by mahasiswa.nim having umur <20; 

--task 3
-- untuk memunculkan nama mahasiswa yang memiliki nilai B ke atas
update belajar set nilai='A' where nomor=1; 
update belajar set nilai='A+' where nomor=2;
update belajar set nilai='B' where nomor=3; 
update belajar set nilai='C' where nomor=4; 
--untuk memunculkan nilai diatas B 
-- ini salah karena data nim pada tabel belajar salah input, yaitu memasukan nim yang tidak ada pada tabel mahasiswa, kenapa? untuk memunculkan masalah ini buat nim di belajar yang tidak ada di tabel mahasiswa
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) cross join mahasiswa using(id_jurusan) cross join belajar Using(id_mata_kuliah) group by belajar.nilai having nilai != 'C';
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) cross join mahasiswa using(id_jurusan) cross join belajar Using(id_mata_kuliah) where nilai IN('A+','A','B');

-- mengupdet data nim pada belajar
update belajar set nim ='2411101' where nomor=2;

--memunculkan mahasiswa yang punya B KE ATAS
select*from belajar cross join mahasiswa using(nim) group by belajar.nilai having nilai != 'C';
select name_mahasiswa, id_mata_kuliah, nilai  from belajar cross join mahasiswa using(nim) group by belajar.nilai having nilai != 'C'; 
select name_mahasiswa, id_mata_kuliah, nilai  from belajar cross join mahasiswa using(nim) where nilai IN('A+','A','B');

-- task 4
--menambahkan matkuliah
INSERT INTO mata_kuliah VALUES('TM01','Teknologi Minyak', '4');
INSERT INTO mata_kuliah VALUES('TB01','Teknologi Buah', '4');
INSERT INTO mata_kuliah VALUES('TK01','Teknologi Karet', '4');
INSERT INTO mata_kuliah VALUES('KB01','Kimia Berbahaya', '4');
INSERT INTO mata_kuliah VALUES('DM01','Data Mining', '4');

--menambahkan dosen
INSERT INTO dosen VALUES('D111103','Dr. Sodikin','111');
INSERT INTO dosen VALUES('D111104','Ir. Asfari','111');
INSERT INTO dosen VALUES('D112401','Ir. Jedil','124');

--menambahkan jurusan
INSERT INTO jurusan VALUES('124','Teknik Informatika');


--menambah mahasiswa
INSERT INTO mahasiswa VALUES('2411102','johani','jl. serut no.32 palembang','111','19');
INSERT INTO mahasiswa VALUES('2412401','mastam','jl. cikerut no.2 cilegon','124','20');
INSERT INTO mahasiswa VALUES('2411103','sukaro','jl. beringin no.3 pandeglang','111','17');



--menambahkan belajar
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411101','TM01','A');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411101','TB01','A');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411101','TK01','A');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411101','KB01','A');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411102','KB01','D');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411102','TK01','A');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411102','TB01','B');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411102','TM01','C');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2412401','DM01','A');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411103','TM01','B');
INSERT INTO belajar (nim, id_mata_kuliah, nilai)VALUES('2411103','TK01','E');

--menambahkan mengajar
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D112401','DM01');
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D111101','TM01');
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D111101','TB01');
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D111103','TK01');
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D111103','KB01');


--untuk menAMPILKAN mahasiswa yang memiliki sks lebih dari 10
select mahasiswa.name_mahasiswa, sum(sks) as jumlah_SKS from belajar cross join mahasiswa using(nim)cross join mata_kuliah using(id_mata_kuliah)group by mahasiswa.nim having jumlah_SKS>10; 

--task 5 
--menampilkan mahasiswa yang mengontrak mata kuliah "data mining"
select mahasiswa.name_mahasiswa, mata_kuliah.name_mata_kuliah from belajar cross join mahasiswa using(nim)cross join mata_kuliah USING(id_mata_kuliah) group by mahasiswa.name_mahasiswa having name_mata_kuliah='Data Mining';

--task 6
--untuk menampilkan jumlah mahasiswa untuk setiap dosen
select dosen.name_dosen, count(name_mahasiswa) as jumlah_mahasiswa from dosen cross join mengajar using(nip) cross join mata_kuliah using(id_mata_kuliah) cross join belajar using (id_mata_kuliah) cross join mahasiswa using(nim) group by dosen.name_dosen having jumlah_mahasiswa; 
select dosen.name_dosen, mata_kuliah.name_mata_kuliah, count(name_mahasiswa) as jumlah_mahasiswa from dosen cross join mengajar using(nip) cross join mata_kuliah using(id_mata_kuliah) cross join belajar using (id_mata_kuliah) cross join mahasiswa using(nim) group by mata_kuliah.name_mata_kuliah  having jumlah_mahasiswa;

--task 7
--untuk mengurutkan mahasiswa berdasarkan umur dr yang paling muda
select * from mahasiswa order by umur asc;  

-- task 8
-- untuk menampilkan mahasiswa yang ngulang
select mahasiswa.name_mahasiswa, jurusan.name_jurusan, dosen.name_dosen ,mata_kuliah.name_mata_kuliah, belajar.nilai from belajar cross join mata_kuliah using (id_mata_kuliah) cross join mahasiswa using (nim) cross join dosen using (id_jurusan) cross join jurusan using(id_jurusan)group by mahasiswa.name_mahasiswa  having  nilai >'C';  




select*from mahasiswa cross join jurusan using(id_jurusan);
select*from Dosen cross join jurusan using(id_jurusan);
select*from Dosen cross join jurusan using(id_jurusan) cross join mahasiswa using(id_jurusan);
select*from dosen ross join mengajar using(nip);
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah);
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) order by nomor desc; 
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) cross join mahasiswa using(id_jurusan) order by nomor desc;
select nim, name_mahasiswa from (select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) cross join mahasiswa using(id_jurusan) order by nomor desc);
-- untuk memunculkan nama mahasiswa yang mengikuti mata kuliah ilmu pangan
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) cross join mahasiswa using(id_jurusan) group by mahasiswa.nim having name_mata_kuliah= 'Ilmu pangan'; 
