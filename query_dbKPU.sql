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