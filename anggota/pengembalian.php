<?php
include'../koneksi.php';
date_default_timezone_set("Asia/Jakarta");

$id = $_GET['id']; // id_transaksi
$buku = $_GET['buku']; // id_buku
$tgl = date('Y-m-d H:i:s');

$query = "UPDATE transaksi SET tgl_kembali='$tgl', status_transaksi='pengembalian' WHERE id_transaksi='$id'";
$data = mysqli_query($koneksi, $query);

if($data){
    // MENAMBAH STOK: stok = stok + 1
    mysqli_query($koneksi, "UPDATE buku SET stok = stok + 1 WHERE id_buku='$buku'");
    echo"<script>alert('✅ Buku sudah dikembalikan'); window.location.assign('?halaman=history');</script>";
}
?>