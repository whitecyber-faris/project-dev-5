CREATE DATABASE Tugas2_221122064_AgnesTasyaGoh;

CREATE SCHEMA Produksi;

CREATE SCHEMA Pembelian;

CREATE TABLE Kategori (
    IDKategori VARCHAR(5) PRIMARY KEY NOT NULL,
    NamaKategori VARCHAR(15) NOT NULL
);

CREATE TABLE Produk (
  		IDProduk VARCHAR(5) PRIMARY KEY NOT NULL,
		NamaProduk VARCHAR(50) NOT NULL,
		IDKategori VARCHAR(5) FOREIGN KEY NOT NULL,
		HargaSatuan MONEY NOT NULL
		) ON [PRIMARY];

CREATE TABLE Persediaan (
		IDProduk VARCHAR(5) PRIMARY KEY NOT NULL,
		Stok INT NOT NULL
		) ON [PRIMARY];

CREATE TABLE Pemasok (
		IDPemasok VARCHAR(5) PRIMARY KEY NOT NULL,
		NamaPemasok VARCHAR(50) NOT NULL,
		Alamat VARCHAR(100) NOT NULL,
		NoTelp VARCHAR(13) NOT NULL
		) ON [PRIMARY];

CREATE TABLE HeaderPesananPembelian (
    		IDPesananPembelian VARCHAR(5) PRIMARY KEY NOT NULL,
    		TanggalPesananPembelian DATE NOT NULL,
    		IDPelanggan VARCHAR(5) FOREIGN KEY NOT NULL,
    		Total MONEY NOT NULL,
    		Status BIT NOT NULL
		) ON [PRIMARY];

ALTER TABLE Pemasok ADD ContactPerson VARCHAR(13) NULL;

EXEC sp_rename 'Pemasok.NoTelp', 'NoTelepon', 'COLUMN';

INSERT INTO Produk (IDProduk, NamaProduk, IDKategori, HargaSatuan)
VALUES (P1, 'Monitor', K1, 1000000),
       (P2, 'Kertas A4', K2, 50000),
       (P3, 'PC', K1, 3400000),
       (P4, 'Tinta Printer', K2, 40000),
       (P5, 'Keyboard', K1, 150000);


INSERT INTO Pemasok (IDPemasok, NamaPemasok, Alamat, NoTelp)
VALUES (PM1, 'PT. Aku', 'Jl. Argo No.1', '08123456789'),
       (PM2, 'PT. Bobo', 'Jl. Botu No.2', '08234567890'),
       (PM3, 'Cv. Cinta', 'Jl. Cokro No.3', '08345678901'),
       (PM4, 'Cv. Dita', 'Jl. Dwain No.4', '08456789012'),
       (PM5, 'PT. Eka', 'Jl. Ela No.5', '08567890123');

SELECT IDProduk,NamaProduk,HargaSatuan FROM Produk WHERE HargaSatuan < 50000;

SELECT * FROM Pemasok WHERE No_Telp LIKE '0821%';

DELETE FROM Pemasok WHERE NamaPemasok LIKE '%ob%'

UPDATE Pemasok SET Alamat = 'Jl. Semangka No. 100' WHERE IDPemasok = 'PM1';

USE master;
	GO
ALTER DATABASE Tugas2_NIM_Nama SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	GO
	ALTER DATABASE Tugas2_NIM_Nama SET OFFLINE;
	GO
	EXEC sp_detach_db 'Tugas2_221122064_AgnesTasyaGoh';
	GO

