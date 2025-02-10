/* Untuk mengganti schema DB yang digunakan */
use pendataan_kpu;

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