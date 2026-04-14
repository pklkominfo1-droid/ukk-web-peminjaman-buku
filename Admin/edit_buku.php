<?php
include '../koneksi.php';

// Ambil ID dari URL
$id = $_GET['id'];

// Ambil data buku berdasarkan ID
$query = mysqli_query($koneksi, "SELECT * FROM buku WHERE id_buku='$id'");
$data  = mysqli_fetch_array($query);
?>

<div class="row">
    <div class="col-md-6">
        <h4>Edit Data Buku</h4>
        <div class="card p-4">
            <form action="?halaman=proses_edit_buku" method="post">
                <input type="hidden" name="id_buku" value="<?= $data['id_buku'] ?>">

                <div class="mb-3">
                    <label class="form-label">Judul Buku</label>
                    <input type="text" name="judul_buku" class="form-control" value="<?= $data['judul_buku'] ?>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Pengarang</label>
                    <input type="text" name="pengarang" class="form-control" value="<?= $data['pengarang'] ?>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Penerbit</label>
                    <input type="text" name="penerbit" class="form-control" value="<?= $data['penerbit'] ?>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Tahun Terbit</label>
                    <input type="number" name="tahun_terbit" class="form-control" value="<?= $data['tahun_terbit'] ?>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Jumlah Stok</label>
                    <input type="number" name="stok" class="form-control" value="<?= $data['stok'] ?>" min="0" required>
                    <small class="text-muted">Ubah angka ini untuk menambah atau mengurangi stok fisik.</small>
                </div>

                <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
                <a href="?halaman=data_buku" class="btn btn-secondary">Kembali</a>
            </form>
        </div>
    </div>
</div>