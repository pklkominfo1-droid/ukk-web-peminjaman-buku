<h4>Data Buku</h4>
<a href="?halaman=input_buku" class="btn btn-secondary">
    ➕ Tambah Data Buku
</a>
<table class="table table-bordered mt-3">
    <tr class="fw-bold bg-light">
        <td>No</td>
        <td>Judul Buku</td>
        <td>Pengarang</td>
        <td>Penerbit</td>
        <td>Tahun Terbit</td>
        <td>Stok</td> <td>Status</td>
        <td>Kelola</td>
    </tr>
    <?php 
    $no = 1;
    include'../koneksi.php';
    $query  = "SELECT*FROM buku ORDER BY id_buku DESC";
    $data   = mysqli_query($koneksi, $query);
    foreach($data as $buku){ ?>
    <tr>
        <td><?= $no++; ?></td>
        <td><?= $buku['judul_buku'] ?></td>
        <td><?= $buku['pengarang'] ?></td>
        <td><?= $buku['penerbit'] ?></td>
        <td><?= $buku['tahun_terbit'] ?></td>
        <td>
            <span class="badge bg-info text-dark"><?= $buku['stok'] ?> Unit</span>
        </td>
        <td>
            <?php if($buku['stok'] > 0) { ?>
                <span class="badge bg-success">Tersedia</span>
            <?php } else { ?>
                <span class="badge bg-danger">Habis</span>
            <?php } ?>
        </td>
        <td>
            <a class="btn btn-warning btn-sm" href="?halaman=edit_buku&id=<?= $buku['id_buku'] ?>">Edit</a>
            <a class="btn btn-danger btn-sm" onclick="return confirm('Yakin data dihapus?')" href="?halaman=hapus_buku&id=<?= $buku['id_buku'] ?>">Hapus</a>
        </td>
    </tr>
   <?php } ?>
</table>