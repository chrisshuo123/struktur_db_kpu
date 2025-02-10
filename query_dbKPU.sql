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