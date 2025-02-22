/* Untuk mengganti schema DB yang digunakan */
use pendataan_kpu;

/* *** 1 - TABLE WILAYAH (PROVINSI) *** */
/* Table Wilayah (Provinsi) */
CREATE TABLE provinsi
(
	idProvinsi INT(4) NOT NULL AUTO_INCREMENT,
    provinsi VARCHAR(30) NOT NULL,
    PRIMARY KEY (idProvinsi)
) ENGINE = InnoDB;

select * from provinsi;
describe provinsi;

/* Testing a table provinsi by inserting 1 province, Jawa Timur */
INSERT INTO provinsi(idProvinsi, provinsi)
VALUES(1, 'Jawa Timur');

DESCRIBE provinsi;

/* *** 2 - TABLE KOTAKABUPATEN *** */
/* Table kotaKabupaten */
CREATE TABLE kotaKabupaten
(
	idKotaKab INT(4) NOT NULL AUTO_INCREMENT,
    kotaKab VARCHAR(30) NOT NULL,
    idProvinsi_fk INT NOT NULL,
    PRIMARY KEY (idKotaKab),
    CONSTRAINT fk_kotaKabupaten_provinsi
    FOREIGN KEY (idProvinsi_fk) REFERENCES provinsi(idProvinsi)
) ENGINE = InnoDB;

select * from kotaKabupaten;
DESCRIBE kotaKabupaten;

/* Testing a table kotaKabupaten by inserting 1 kotaKabupaten, Surabaya */
INSERT INTO kotaKabupaten(idKotaKab, kotaKab, idProvinsi_fk)
VALUES(1, 'Surabaya', 1);

SELECT * FROM kotaKabupaten;
describe kotaKabupaten;

/* *** 3 - TABLE KECAMATAN *** */
/* Table Kecamatan */
CREATE TABLE kecamatan
(
	idKecamatan INT(4) NOT NULL AUTO_INCREMENT,
    kecamatan VARCHAR(30) NOT NULL,
	idKotaKab_fk INT NOT NULL,
	idProvinsi_fk INT NOT NULL,
    PRIMARY KEY (idKecamatan),
    CONSTRAINT fk_kecamatan_kotaKabupaten
    FOREIGN KEY (idKotaKab_fk) REFERENCES kotaKabupaten(idKotaKab),
    CONSTRAINT fk_kecamatan_provinsi
    FOREIGN KEY (idProvinsi_fk) REFERENCES provinsi(idProvinsi)
) ENGINE = InnoDB;

select * from kecamatan;
describe kecamatan;

/* Insert Kecamatan (Subdistrict) linked with Surabaya, Jawa Timur */
INSERT INTO kecamatan(idKecamatan, kecamatan, idKotaKab_fk, idProvinsi_fk)
VALUES	(1, 'Dukuh Pakis', 1, 1),
		(2, 'Gayungan', 1, 1),
		(3, 'Jambangan', 1, 1),
		(4, 'Karang Pilang', 1, 1),
        (5, 'Sawahan', 1, 1),
        (6, 'Wiyung', 1, 1),
        (7, 'Wonocolo', 1, 1),
        (8, 'Wonokromo', 1, 1),
        (9, 'Gubeng', 1, 1),
        (10, 'Gunung Anyar', 1, 1),
        (11, 'Mulyorejo', 1, 1),
        (12, 'Rungkut', 1, 1),
        (13, 'Sukolilo', 1, 1),
        (14, 'Tambaksari', 1, 1),
        (15, 'Tenggilis Mejoyo', 1, 1),
        (16, 'Bubutan', 1, 1),
        (17, 'Genteng', 1, 1),
        (18, 'Simokerto', 1, 1),
        (19, 'Tegalsari', 1, 1),
        (20, 'Bulak', 1, 1),
        (21, 'Kenjeran', 1, 1),
        (22, 'Krembangan', 1, 1),
        (23, 'Pabean Cantian', 1, 1),
        (24, 'Semampir', 1, 1),
        (25, 'Asem Rowo', 1, 1),
        (26, 'Benowo', 1, 1),
        (27, 'Lakarsantri', 1, 1),
        (28, 'Pakal', 1, 1),
        (29, 'Sambikerep', 1, 1),
        (30, 'Sukomanunggal', 1, 1),
        (31, 'Tandes', 1, 1);
        
SELECT * FROM kecamatan;
describe kecamatan;

/* *** 4 - TABLE KELURAHAN (Ward Subdistrict) *** */
/* Table Kelurahan */
CREATE TABLE kelurahan
(
	idKelurahan INT(4) NOT NULL AUTO_INCREMENT,
    kelurahan VARCHAR(30) NOT NULL,
    idKecamatan_fk INT NOT NULL,
    idKotaKab_fk INT NOT NULL,
    idProvinsi_fk INT NOT NULL,
    PRIMARY KEY (idKelurahan),
    CONSTRAINT fk_kelurahan_kecamatan FOREIGN KEY (idKecamatan_fk) REFERENCES kecamatan(idKecamatan),
    CONSTRAINT fk_kelurahan_kotaKabupaten FOREIGN KEY (idKotaKab_fk) REFERENCES kotaKabupaten(idKotaKab),
    CONSTRAINT fk_kelurahan_provinsi FOREIGN KEY (idprovinsi_fk) REFERENCES provinsi(idProvinsi)
) ENGINE = InnoDB;

select * from kelurahan;
describe kelurahan;

/* Insert Kelurahan (Ward Subdistrict) for each Kecamatan (subdistrict in Surabaya, Indonesia) */
INSERT INTO kelurahan(idKelurahan, kelurahan, idKecamatan_fk, idKotaKab_fk, idProvinsi_fk)
VALUES	(1, 'Dukuh Kupang', 1, 1, 1),
		(2, 'Dukuh Pakis', 1, 1, 1),
        (3, 'Gunung Sari', 1, 1, 1),
        (4, 'Pradah Kalikendal', 1, 1, 1),
        (5, 'Dukuh Menanggal', 2, 1, 1),
        (6, 'Gayungan', 2, 1, 1),
        (7, 'Ketintang', 2, 1, 1),
        (8, 'Menanggal', 2, 1, 1),
        (9, 'Jambangan', 3, 1, 1),
        (10, 'Karah', 3, 1, 1),
        (11, 'Kebonsari', 3, 1, 1),
        (12, 'Pagesangan', 3, 1, 1),
        (13, 'Karang Pilang', 4, 1, 1),
        (14, 'Kebraon', 4, 1, 1),
        (15, 'Kedurus', 4, 1, 1),
        (16, 'Waru Gunung', 4, 1, 1),
        (17, 'Banyu Urip', 5, 1, 1),
        (18, 'Kupang Krajan', 5, 1, 1),
        (19, 'Pakis', 5, 1, 1),
        (20, 'Petemon', 5, 1, 1),
        (21, 'Putat Jaya', 5, 1, 1),
        (22, 'Sawahan', 5, 1, 1),
        (23, 'Babatan', 6, 1, 1),
        (24, 'Balas Klumprik', 6, 1, 1),
        (25, 'Jajar Tunggal', 6, 1, 1),
        (26, 'Wiyung', 6, 1, 1),
        (27, 'Bendul Merisi', 7, 1, 1),
        (28, 'Jemur Wonosari', 7, 1, 1),
        (29, 'Margorejo', 7, 1, 1),
        (30, 'Siwalankerto', 7, 1, 1),
        (31,'Darmo', 8, 1, 1),
        (32, 'Jagir', 8, 1, 1),
        (33, 'Ngagel', 8, 1, 1),
        (34, 'Ngagel Rejo', 8, 1, 1),
        (35, 'Sawunggaling', 8, 1, 1),
        (36, 'Wonokromo', 8, 1, 1),
        (37, 'Airlangga', 9, 1, 1),
        (38, 'Baratajaya', 9, 1, 1),
        (39, 'Gubeng', 9, 1, 1),
        (40, 'Kertajaya', 9, 1, 1),
        (41, 'Mojo', 9, 1, 1),
        (42, 'Pucang Sewu', 9, 1, 1),
        (43, 'Gunung Anyar', 10, 1, 1),
        (44, 'Gunung Anyar Tambak', 10, 1, 1),
        (45, 'Rungkut Menanggal', 10, 1, 1),
        (46, 'Rungkut Tengah', 10, 1, 1),
        (47, 'Dukuh Sutorejo', 11, 1, 1),
        (48, 'Kalijudan', 11, 1, 1),
        (49, 'Kalisari', 11, 1, 1),
        (50, 'Kejawan Putih Tambak', 11, 1, 1),
        (51, 'Manyar Sabrangan', 11, 1, 1),
        (52, 'Mulyorejo', 11, 1, 1),
        (53, 'Kalirungkut', 12, 1, 1),
        (54, 'Kedung Baruk', 12, 1, 1),
        (55, 'Medokan Ayu', 12, 1, 1),
        (56, 'Penjaringan Sari', 12, 1, 1),
        (57, 'Rungkut Kidul', 12, 1, 1),
        (58, 'Wonorejo Rungkut', 12, 1, 1),
        (59, 'Gebang Putih', 13, 1, 1),
        (60, 'Keputih', 13, 1, 1),
        (61, 'Klampis Ngasem', 13, 1, 1),
        (62, 'Medokan Semampir', 13, 1, 1),
        (63, 'Menur Pumpungan', 13, 1, 1),
        (64, 'Nginden Jangkungan', 13, 1, 1),
        (65, 'Semolowaru', 13, 1, 1),
        (66, 'Dukuh Setro', 14, 1, 1),
        (67, 'Gading', 14, 1, 1),
        (68, 'Kapasmadya Baru', 14, 1, 1),
        (69, 'Pacarkeling', 14, 1, 1),
        (70, 'Pacarkembang', 14, 1, 1),
        (71, 'Ploso', 14, 1, 1),
        (72, 'Rangkah', 14, 1, 1),
        (73, 'Tambaksari', 14, 1, 1),
        (74, 'Kendangsari', 15, 1, 1),
        (75, 'Kutisari', 15, 1, 1),
        (76, 'Panjang Jiwo', 15, 1, 1),
        (77, 'Tenggilis Mejoyo', 15, 1, 1),
        (78, 'Alun-Alun Contong', 16, 1, 1),
        (79, 'Bubutan', 16, 1, 1),
        (80, 'Gundih', 16, 1, 1),
        (81, 'Jepara', 16, 1, 1),
        (82, 'Tembok Dukuh', 16, 1, 1),
        (83, 'Embong Kaliasin', 17, 1, 1),
        (84, 'Genteng', 17, 1, 1),
        (85, 'Kapasari', 17, 1, 1),
        (86, 'Ketabang', 17, 1, 1),
        (87, 'Peneleh', 17, 1, 1),
        (88, 'Kapasan', 18, 1, 1),
        (89, 'Sidodadi', 18, 1, 1),
        (90, 'Simokerto', 18, 1, 1),
        (91, 'Simolawang', 18, 1, 1),
        (92, 'Tambakrejo', 18, 1, 1),
        (93, 'Dr. Soetomo', 19, 1, 1),
        (94, 'Kedungdoro', 19, 1, 1),
        (95, 'Keputran', 19, 1, 1),
        (96, 'Tegalsari', 19, 1, 1),
        (97, 'Wonorejo Tegalsari', 19, 1, 1),
        (98, 'Bulak', 20, 1, 1),
        (99, 'Kedung Cowek', 20, 1, 1),
        (100, 'Kenjeran', 20, 1, 1),
        (101, 'Sukolilo Baru', 20, 1, 1),
        (102, 'Bulak Banteng', 21, 1, 1),
        (103, 'Sidotopo Wetan', 21, 1, 1),
        (104, 'Tambak Wedi', 21, 1, 1),
        (105, 'Tanah Kali Kedinding', 21, 1, 1),
        (106, 'Dupak', 22, 1, 1),
        (107, 'Kemayoran', 22, 1, 1),
        (108, 'Krembangan Selatan', 22, 1, 1),
        (109, 'Morokrembangan', 22, 1, 1),
        (110, 'Perak Barat', 22, 1, 1),
        (111, 'Bongkaran', 23, 1, 1),
        (112, 'Krembangan Utara', 23, 1, 1),
        (113, 'Nyamplungan', 23, 1, 1),
        (114, 'Perak Timur', 23, 1, 1),
        (115, 'Perak Utara', 23, 1, 1),
        (116, 'Tanjung Perak', 23, 1, 1),
        (117, 'Ampel', 24, 1, 1),
        (118, 'Pegirian', 24, 1, 1),
        (119, 'Sidotopo', 24, 1, 1),
        (120, 'Ujung', 24, 1, 1),
        (121, 'Wonokusumo', 24, 1, 1),
        (122, 'Asem Rowo', 25, 1, 1),
        (123, 'Genting Kalianak', 25, 1, 1),
        (124, 'Tambak Sarioso', 25, 1, 1),
        (125, 'Kandangan', 26, 1, 1),
        (126, 'Romokalisari', 26, 1, 1),
        (127, 'Sememi', 26, 1, 1),
        (128, 'Tambak Oso Wilangun', 26, 1, 1),
        (129, 'Bangkingan', 27, 1, 1),
        (130, 'Jeruk', 27, 1, 1),
        (131, 'Lakarsantri', 27, 1, 1),
        (132, 'Lidah Kulon', 27, 1, 1),
        (133, 'Lidah Wetan', 27, 1, 1),
        (134, 'Sumurwelut', 27, 1, 1),
        (135, 'Babat Jerawat', 28, 1, 1),
        (136, 'Benowo', 28, 1, 1),
        (137, 'Pakal', 28, 1, 1),
        (138, 'Sumber Rejo', 28, 1, 1),
        (139, 'Beringin', 29, 1, 1),
        (140, 'Lontar', 29, 1, 1),
        (141, 'Made', 29, 1, 1),
        (142, 'Sambikerep', 29, 1, 1),
        (143, 'Putat Gede', 30, 1, 1),
        (144, 'Simomulyo', 30, 1, 1),
        (145, 'Simomulyo Baru', 30, 1, 1),
        (146, 'Sonokwijenan', 30, 1, 1),
        (147, 'Sukomanunggal', 30, 1, 1),
        (148, 'Tanjungsari', 30, 1, 1),
        (149, 'Balongsari', 31, 1, 1),
        (150, 'Banjar Sugihan', 31, 1, 1),
        (151, 'Karang Poh', 31, 1, 1),
        (152, 'Manukan Kulon', 31, 1, 1),
        (153, 'Manukan Wetan', 31, 1, 1),
        (154, 'Tandes', 31, 1, 1);
        
SELECT * FROM kelurahan;

/* ***=== INI KHUSUS TABEL DB SUARA KPU ===*** */
/* 1 - Tabel Suara */
CREATE TABLE suara (
    idSuara int(10) primary key not null auto_increment,
    idKelurahan_fk int(10), /* Wajib Not Null */
    idTanggalPengesahan_fk int(10), /* Wajib Not Null */
    tot_pemilihAktif int(10),
    tot_pemilihBaru int(10),
    tot_pemilihTidakMemenuhiSyarat int(10),
    tot_perbaikanDataPemilih int(10),
    tot_pemilihPotensialNonKTP int(10),
    idLembarFisik int(10) not null, /* Wajib Not Null */
    created_at timestamp not null default current_timestamp
) Engine = InnoDB;

alter table suara
    add constraint idKelurahan_fk foreign key (idKelurahan_fk)
    references kelurahan (idKelurahan),
    add constraint idTanggalPengesahan_fk foreign key (idTanggalPengesahan_fk)
    references tgl_pengesahan (idTanggalPengesahan);

alter table suara
    rename idLembarFisik to idLembarFisik_fk;

alter table suara
    add constraint idLembarFisik_fk foreign key (idLembarFisik_fk)
    references lembarfisik (idLembarFisik);

alter table suara
    modify idKelurahan_fk int(10) not null,
    modify idTanggalPengesahan_fk int(10) not null;

alter table suara
    add column nomorTPS int(10) not null after idSuara;

/* 2 - Table LembarFisik */
create table lembarfisik (
    idLembarFisik int(10) primary key not null auto_increment,
    foto_depan mediumblob not null,
    foto_belakang mediumblob not null,
    foto_kehadiran mediumblob not null,
    foto_uangTransport mediumblob not null
) ENGINE = InnoDB;

/* 3 - Table Tgl Pengesahan */
create table tgl_pengesahan (
    idTanggalPengesahan int(10) primary key not null auto_increment,
    tanggal_pengesahan date not null
) ENGINE = InnoDB;

/* 4 - Table Kegiatan */
create table kegiatan (
    idKegiatan int(10) primary key not null auto_increment,
    idTanggalPengesahan_fk int(10) not null,
    idKelurahan_fk int(10) not null,
    idPengurus_fk int(10) not null,
) ENGINE = InnoDB;

alter table kegiatan
    add constraint idTanggalPengesahan_fk foreign key (idTanggalPengesahan_fk)
    references tgl_pengesahan (idTanggalPengesahan),
    add constraint idPengurus_fk foreign key (idPengurus_fk)
    references pengurus_kpu (idPengurus);

/* 5 - Table Pengurus_KPU (tabel anggota) */
create table pengurus_kpu (
    idPengurus int(10) primary key not null auto_increment,
    posisi enum('ketua', 'anggota') not null,
    nama_petugas varchar(50) not null
) ENGINE = InnoDB;