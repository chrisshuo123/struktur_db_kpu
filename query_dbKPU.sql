/* Untuk mengganti schema DB yang digunakan */
use pendataan_kpu;

/* *** 1 - TABLE WILAYAH *** */
/* Table Wilayah */
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

