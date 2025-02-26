PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE jurusan(id_jurusan character(3) primary key not null, name_jurusan varchar(50) not null);
INSERT INTO jurusan VALUES('111','Teknologi Hasil Pertanian');
INSERT INTO jurusan VALUES('112','Sosial Ekonomi Pertanian');
INSERT INTO jurusan VALUES('113','Teknologi Mesin Pertanian');
INSERT INTO jurusan VALUES('124','Teknik Informatika');
CREATE TABLE dosen(nip character(7) primary key not null, name_dosen varchar(50) not null,id_jurusan character(3), foreign key(id_jurusan) references jurusan(id_jurusan));
INSERT INTO dosen VALUES('D111101','Ir. Satro','111');
INSERT INTO dosen VALUES('D111201','Ir. Sairi','112');
INSERT INTO dosen VALUES('D111301','Ir. Sarbini','113');
INSERT INTO dosen VALUES('D111102','Ir. Wahiji','111');
INSERT INTO dosen VALUES('D111103','Dr. Sodikin','111');
INSERT INTO dosen VALUES('D111104','Ir. Asfari','111');
INSERT INTO dosen VALUES('D112401','Ir. Jedil','124');
CREATE TABLE mahasiswa(nim character(7) primary key not null, name_mahasiswa varchar(50) not null, alamat text(100),id_jurusan varchar(3), umur integer(2), foreign key(id_jurusan) references jurusan(id_jurusan));
INSERT INTO mahasiswa VALUES('2411101','muksin','jl. waringin kurung no.60 serang banten','111',25);
INSERT INTO mahasiswa VALUES('2411201','hilmi','jl. soekarno Hatta no. 1 bandung','112',18);
INSERT INTO mahasiswa VALUES('2411301','ramdani','jl. soekarno Hatta no. 3 lampung','113',16);
INSERT INTO mahasiswa VALUES('2411102','johani','jl. serut no.32 palembang','111',19);
INSERT INTO mahasiswa VALUES('2412401','mastam','jl. cikerut no.2 cilegon','124',20);
INSERT INTO mahasiswa VALUES('2411103','sukaro','jl. beringin no.3 pandeglang','111',17);
CREATE TABLE mata_kuliah(id_mata_kuliah character(4) primary key not null, name_mata_kuliah varchar(50), sks integer(1));
INSERT INTO mata_kuliah VALUES('IP01','Ilmu pangan',2);
INSERT INTO mata_kuliah VALUES('TS01','Teknologi sayur',3);
INSERT INTO mata_kuliah VALUES('MF01','Mekanika fluida',2);
INSERT INTO mata_kuliah VALUES('PA01','pengantar agribisnis',2);
INSERT INTO mata_kuliah VALUES('TM01','Teknologi Minyak',4);
INSERT INTO mata_kuliah VALUES('TB01','Teknologi Buah',4);
INSERT INTO mata_kuliah VALUES('TK01','Teknologi Karet',4);
INSERT INTO mata_kuliah VALUES('KB01','Kimia Berbahaya',4);
INSERT INTO mata_kuliah VALUES('DM01','Data Mining',4);
CREATE TABLE mengajar(nomor integer primary key autoincrement, nip character(7) not null, id_mata_kuliah character(4) not null, foreign key (nip) references dosen (nip), foreign key (id_mata_kuliah) references mata_kuliah(id_mata_kuliah));
INSERT INTO mengajar VALUES(1,'D111101','IP01');
INSERT INTO mengajar VALUES(2,'D111102','TS01');
INSERT INTO mengajar VALUES(3,'D111201','PA01');
INSERT INTO mengajar VALUES(4,'D111301','MF01');
INSERT INTO mengajar VALUES(5,'D112401','DM01');
INSERT INTO mengajar VALUES(6,'D111101','TM01');
INSERT INTO mengajar VALUES(7,'D111101','TB01');
INSERT INTO mengajar VALUES(8,'D111103','TK01');
INSERT INTO mengajar VALUES(9,'D111103','KB01');
CREATE TABLE belajar(nomor integer primary key autoincrement, nim character(7) not null, id_mata_kuliah character(4) not null, nilai character(2),foreign key (nim) references mahasiswa (nim), foreign key (id_mata_kuliah) references mata_kuliah(id_mata_kuliah));
INSERT INTO belajar VALUES(1,'2411101','IP01','A');
INSERT INTO belajar VALUES(2,'2411101','TS01','A+');
INSERT INTO belajar VALUES(3,'2411201','PA01','B');
INSERT INTO belajar VALUES(4,'2411301','MF01','C');
INSERT INTO belajar VALUES(5,'2411101','TM01','A');
INSERT INTO belajar VALUES(6,'2411101','TB01','A');
INSERT INTO belajar VALUES(7,'2411101','TK01','A');
INSERT INTO belajar VALUES(8,'2411101','KB01','A');
INSERT INTO belajar VALUES(9,'2411102','KB01','D');
INSERT INTO belajar VALUES(10,'2411102','TK01','A');
INSERT INTO belajar VALUES(11,'2411102','TB01','B');
INSERT INTO belajar VALUES(12,'2411102','TM01','C');
INSERT INTO belajar VALUES(13,'2412401','DM01','A');
INSERT INTO belajar VALUES(14,'2411103','TK01','E');
INSERT INTO sqlite_sequence VALUES('mengajar',9);
INSERT INTO sqlite_sequence VALUES('belajar',14);
COMMIT;
