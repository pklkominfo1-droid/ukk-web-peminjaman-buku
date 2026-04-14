<?php
include '../koneksi.php';

// Ambil data dari POST
$id_buku      = $_POST['id_buku'];
$judul_buku   = $_POST['judul_buku'];
$pengarang    = $_POST['pengarang'];
$penerbit     = $_POST['penerbit'];
$tahun_terbit = $_POST['tahun_terbit'];
$stok         = $_POST['stok'];

// Tentukan status otomatis berdasarkan stok
// Jika stok lebih dari 0 maka tersedia, jika 0 maka tidak tersedia
$status = ($stok > 0) ? 'tersedia' : 'tidak tersedia';

// Query Update
$query = "UPDATE buku SET 
            judul_buku   = '$judul_buku', 
            pengarang    = '$pengarang', 
            penerbit     = '$penerbit', 
            tahun_terbit = '$tahun_terbit', 
            stok         = '$stok', 
            status       = '$status' 
          WHERE id_buku  = '$id_buku'";

$update = mysqli_query($koneksi, $query);

if($update){
    echo "<script>alert('✅ Data buku berhasil diperbarui!'); window.location.assign('?halaman=data_buku');</script>";
} else {
    echo "<script>alert('❌ Gagal memperbarui data'); window.history.back();</script>";
}
?>