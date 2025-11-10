# naiki_station

## Tugas 7

<details>
<summary>Jawaban</summary>

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree pada Flutter adalah struktur hierarki yang menggambarkan bagaimana setiap elemen antarmuka pengguna (UI)
tersusun dan saling berhubungan. Semua tampilan di Flutter dibangun dari widget, seperti teks dan icon,
hingga hal besar seperti layout dan halaman aplikasi.  ada widget induk (parent) yang berfungsi sebagai platform,
dan di dalamnya terdapat widget anak (child) yang menjadi bagian dari struktur tersebut.
Setiap parent dapat memiliki satu atau beberapa child, tergantung jenis widget-nya.
Misalnya, widget Column dapat memiliki banyak child, sementara Container biasanya hanya memiliki satu.
Hubungan parent–child ini yang nentuin gimana tampilan ditata, bagaimana event seperti klik ditangani,
dan bagaimana perubahan state terjadi. Saat terjadi pembaruan pada salah satu widget,
Flutter akan memeriksa dan memperbarui bagian pohon yang terpengaruh saja, sehingga proses rendering menjadi efisien.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya

- **MaterialApp**
  Berfungsi sebagai root aplikasi Flutter. Mengatur tema, navigasi, dan struktur dasar aplikasi.

- **ThemeData**
  Digunakan untuk menentukan gaya tampilan aplikasi seperti warna utama, font, dan tema umum.

- **MyApp**
  Widget utama buatan sendiri yang mengembalikan MaterialApp dan menjadi titik awal aplikasi.

- **MyHomePage**
  Halaman utama aplikasi yang menampilkan isi utama dan mengatur struktur tampilan.

- **Scaffold**
  Menyediakan kerangka dasar halaman seperti `appBar`, `body`, dan `floatingActionButton`.

- **AppBar**
  Menampilkan bilah atas halaman yang berisi judul aplikasi.

- **Column dan Row**
  Digunakan untuk menyusun widget secara vertikal (Column) dan horizontal (Row).

- **Padding, SizedBox, dan Center**
  Mengatur jarak antar elemen, ukuran ruang kosong, dan posisi elemen agar lebih rapi.

- **Container**
  Wadah serbaguna yang dapat diatur ukuran, warna latar, serta dekorasinya.

- **GridView.count**
  Menampilkan kumpulan data dalam bentuk grid (tabel) dengan jumlah kolom tertentu.

- **Card**
  Menampilkan tampilan berbentuk kartu dengan efek elevasi (bayangan).

- **InkWell dan Material**
  Memberikan efek interaksi seperti animasi sentuhan pada elemen Card.

- **Text dan TextStyle**
  Menampilkan teks dan mengatur gaya tulisan seperti ukuran, warna, dan ketebalan huruf.

- **Icon dan Icons**
  Menampilkan ikon bawaan Flutter dengan berbagai jenis simbol.

- **Color dan Colors**
  Mengatur warna untuk elemen-elemen seperti ikon, teks, dan latar belakang.

- **MediaQuery**
  Mendapatkan ukuran layar perangkat agar tampilan bisa menyesuaikan dengan resolusi pengguna.

- **ItemCard** (Widget punya kita)
  Menampilkan satu item berupa ikon dan teks di dalam kartu interaktif.

- **InfoCard** (Widget punya kita)
  Menampilkan informasi tambahan dalam bentuk kartu kecil.

- **ItemHomepage** (Class Model)
  Menyimpan data tiap item seperti nama, ikon, dan warna untuk ditampilkan di tampilan utama.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Widget MaterialApp berfungsi sebagai pondasi utama dalam aplikasi Flutter yang menggunakan desain Material Design.
Widget ini mengatur banyak aspek penting dari aplikasi, seperti tema (warna, font, gaya), sistem navigasi antarhalaman (routes),
pengaturan bahasa (localization), serta tampilan elemen-elemen bawaan Material seperti AppBar, Scaffold, dan FloatingActionButton.

MaterialApp sering digunakan sebagai widget root karena ia menyediakan context dan konfigurasi global
yang dibutuhkan oleh hampir semua widget di bawahnya. Tanpa MaterialApp, banyak komponen bawaan Flutter
seperti tombol, teks, dan ikon tidak akan mewarisi gaya Material Design, sehingga tampilannya menjadi tidak konsisten.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

StatelessWidget dan StatefulWidget adalah dua jenis widget utama di Flutter yang dibedakan berdasarkan apakah tampilan (UI)-nya
bisa berubah seiring waktu atau tidak.

StatelessWidget adalah widget yang tidak memiliki state, artinya tampilan yang dihasilkan akan selalu sama selama aplikasi berjalan,
kecuali terjadi rebuild akibat perubahan dari luar (misalnya data dari parent widget). Contoh penggunaan StatelessWidget adalah elemen statis
seperti teks, ikon, atau tombol yang tampilannya tidak berubah setelah dibuat.

Sebaliknya, StatefulWidget adalah widget yang memiliki state, yaitu data atau kondisi internal yang dapat berubah selama aplikasi berjalan.
Ketika state berubah, Flutter akan melakukan rebuild hanya pada bagian yang terpengaruh. Contoh penggunaannya adalah form input,
tombol yang berubah warna saat ditekan, penghitung angka (counter), atau tampilan yang bergantung pada interaksi pengguna.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang merepresentasikan lokasi sebuah widget di dalam widget tree Flutter. Ia berfungsi sebagai “identitas” setiap widget,
yang memungkinkan Flutter mengetahui di mana widget tersebut berada dan bagaimana ia berhubungan dengan widget lain di atas atau di bawahnya dalam hierarki.

BuildContext sangat penting karena digunakan untuk mengakses berbagai informasi dari widget parent, seperti tema (melalui Theme.of(context)), ukuran layar (MediaQuery.of(context)),
navigasi halaman (Navigator.of(context)), dan lain sebagainya. Tanpa BuildContext, widget tidak akan bisa berinteraksi dengan lingkungan sekitarnya di dalam tree.

Di dalam metode build, BuildContext digunakan sebagai parameter yang diteruskan otomatis oleh Flutter.
Fungsinya adalah memberi referensi ke posisi widget tersebut di dalam struktur aplikasi,
sehingga widget bisa membangun tampilannya dengan mempertimbangkan konteks sekitar.
Misalnya, ketika menulis Widget build(BuildContext context),
parameter context ini yang memungkinkan widget memanggil data atau fungsi yang ada di atasnya dalam hierarki.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Simplenya, Saat hot reload dijalankan, Flutter hanya memperbarui kode yang berubah, kemudian menyuntikkannya ke dalam widget tree yang sedang berjalan.
Dengan begitu, tampilan aplikasi langsung menyesuaikan tanpa kehilangan state (misalnya data yang sedang tampil, posisi scroll, atau input pengguna).

Sementara itu, hot restart melakukan proses yang lebih dalam. Flutter akan memuat ulang seluruh aplikasi dari awal dan menghapus seluruh state yang tersimpan,
layaknya menjalankan aplikasi dari awal lagi, tapi masih lebih cepat dibanding full restart

</details>

## Tugas 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() bekerja dengan menambahkan halaman baru di atas tumpukan, sehingga halaman sebelumnya 
masih ada di bawahnya dan pengguna bisa menekan tombol "Back" untuk kembali. 
Sebaliknya, Navigator.pushReplacement() akan mengganti halaman yang sedang aktif dengan halaman baru
halaman lama akan dihapus dari tumpukan sehingga pengguna tidak bisa kembali lagi ke halaman tersebut.

Di aplikasi Football Shop, Navigator.push() idealnya dipakai pas berpindah dari halaman utama ke form "Tambah Produk". 
Sehingga mereka bisa menekan "Back" untuk membatalkan dan kembali ke halaman utama. 
Sementara itu, Navigator.pushReplacement() lebih cocok digunakan saat berpindah halaman melalui drawer 
(seperti di left_drawer.dart) atau saat berpindah dari halaman login ke halaman utama, 
karena kita tidak ingin pengguna bisa menekan "Back" dan kembali ke halaman login setelah berhasil masuk.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Scaffold dipakai sebagai kerangka dasar yang nyiapin struktur standar untuk setiap halaman. 
AppBar ditaruh di properti appBar milik Scaffold buat ngasih header judul yang konsisten di tiap halaman.
Properti drawer di Scaffold diisi pakai satu file LeftDrawer yang sama, jadi menu navigasi sampingnya otomatis seragam di semua halaman

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Padding dipakai buat ngasih jarak biar elemen form kayak TextFormField nggak nempel ke pinggir layar atau nempel satu sama lain, 
jadi kelihatan lebih rapi. SingleChildScrollView ngebungkus semua form biar halamannya bisa di-scroll,
jadi pengguna tetap bisa lihat semua input field meskipun keyboard-nya muncul. 
ListView berguna buat nampilin daftar item secara vertikal, contohnya dipakai di left_drawer.dart 
buat bikin daftar menu navigasi

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Konsistensi warna diatur di file main.dart, di dalam MaterialApp. 
Properti theme dipakai buat nentuin ThemeData, yang di dalamnya ada colorScheme. 
Di situ di tentuin warna primarySwatch (warna utama) dan secondary (warna aksen). 
jadi dengan ditentuin di main, widget kayak AppBar atau tombol bisa otomatis ngambil warna yang sama, 
jadi warnanya konsisten di seluruh aplikasi.