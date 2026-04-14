<?php
include '../koneksi.php';

$judul   = $_POST['judul_buku'];
$pengarang = $_POST['pengarang'];
$penerbit  = $_POST['penerbit'];
$tahun     = $_POST['tahun_terbit'];
$stok      = $_POST['stok'];

// Set status otomatis 'tersedia' jika stok > 0
$status = ($stok > 0) ? 'tersedia' : 'tidak';

$query = "INSERT INTO buku (judul_buku, pengarang, penerbit, tahun_terbit, stok, status) 
          VALUES ('$judul', '$pengarang', '$penerbit', '$tahun', '$stok', '$status')";

$simpan = mysqli_query($koneksi, $query);

if($simpan){
    echo "<script>alert('Data Berhasil Disimpan'); window.location.assign('?halaman=data_buku');</script>";
}
?>