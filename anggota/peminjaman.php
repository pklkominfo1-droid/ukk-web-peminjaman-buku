<?php
include'../koneksi.php';
date_default_timezone_set("Asia/Jakarta");

$id = $_GET['id'];
$id_anggota = $_SESSION['id_anggota'];
$tgl = date('Y-m-d H:i:s');

// Cek stok terlebih dahulu untuk keamanan
$cek_stok = mysqli_query($koneksi, "SELECT stok FROM buku WHERE id_buku='$id'");
$r = mysqli_fetch_array($cek_stok);

if($r['stok'] > 0){
    $query = "INSERT INTO transaksi(id_anggota, id_buku, tgl_pinjam, status_transaksi) 
              VALUES('$id_anggota', '$id', '$tgl', 'peminjaman')";
    $data = mysqli_query($koneksi, $query);

    if($data){
        // MENGURANGI STOK: stok = stok - 1
        mysqli_query($koneksi, "UPDATE buku SET stok = stok - 1 WHERE id_buku='$id'");
        echo"<script>alert('🛒 Buku berhasil dipinjam'); window.location.assign('dashboard.php');</script>";
    }
} else {
    echo"<script>alert('❌ Maaf, stok buku habis!'); window.location.assign('dashboard.php');</script>";
}
?>