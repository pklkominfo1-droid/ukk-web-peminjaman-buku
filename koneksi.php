<?php
$server     = "localhost";
$pengguna   = "root";
$pass   = "";
$database   = "perpustakaan";

$koneksi = mysqli_connect($server,$pengguna,$pass,$database);
if(!$koneksi){
    echo"Koneksi Error : ".mysqli_error($koneksi);
}