# myportofolio_mobile



Nama    : Finna Aprilia

NPM     : 2506538110

Kelas   : PBP - F


### Tugas 7


```Pertanyaan Reflektif```


1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!

Widget sendiri merupakan elemen interface (antarmuka) yang mendeskripsikan bagaimana suatu bagian dari aplikasi ditampilkan pada layar. Framework Flutter menggunakan pendekatan composition, yaitu membangun tampilan dengan cara menggabungkan berbagai widget menjadi struktur yang disebut widget tree. Jadi, widget tree adalah cara Flutter mengatur semua yang dapat dilihat di aplikasi.

Widgte tree dimulai dari widget root, yang merupakan dasar dari semua yang ada di aplikasi. Di bawah akar, terdapat widget lain yang membentuk hierarki atau pohon. Widget di dalam widget lain membentuk widget tree. Widget yang menampung widget lain (parent) meneruskannya melalui child.

Data yang diteruskan dari parent widget menuju child widget dikirimkan dalam bentuk argumen. Sedangkan untuk meneruskan data dari parent menuju child, dilakukan dengan call back functions. Jadi, terdapat call back functions pada children widget yang terdapat di dalam parent widget. Parent widget akan mengambil nilai yang tersedia dari child widget lalu memperbarui dan menampilkan nialinya pada parent widget.


2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

(1) MyHomePage : halaman utama aplikasi 

(2) InfoCard : kartu informasi yang menampilkan judul (title) dan isi (content).

(3) ItemCard : mengatur tata letak dan warna dari komponen-komponen dan menangani interaksi ketika tombol dipencet (menampilkan SnackBar interaktif)


3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!

MaterialApp widget memberikan pengaturan awal yang esensial untuk aplikasi Flutter, seperti menyediakan tema, navigasi, pengaturan lokal, dan memastikan aplikasi mematuhi prinsip dan aturan Material Design. Widget ini digunakan sebagai root wodget karena pada dasarnya MaterialApp bertindak sebagai kontainer dari widget yang lain, dan menyediakan struktir dasar dari antarmuka aplikasi.


4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?

StatelessWidget  bersifat statis dan tidak mengalami perubahan selama aplikasi berjalan, seperti teks atau ikon yang tidak berubah. Sementara itu, StatefulWidget dapat berubah sesuai dengan kondisi atau interaksi pengguna, misalnya tombol yang mengubah tampilan atau input dari pengguna.

Tentukan terlebih dahulu apakah widget ini perlu mengubah datanya sendiri setelah tampil di layar atau tidak. Jika iya, maka gunakan Stateful Widget. Jika tidak, maka gunakan Stateless Widget. 

Contoh kasus penggunaan:

(a) Pada halaman menu utama portofolio, seluruh elemen antarmuka yang akan ditampilkan bersifat tetap (nama, identitas pemilik, kartu menu, dan tombol). Halaman ini tidak perlu menyimpan atau memutasi state lokal secara dinamis. Untuk tampilan statis seperti ini, StatelessWidget adalah pilihan yang tepat karena lebih sederhana: tidak ada objek State yang perlu dibuat dan dikelola.

(b) Pada aplikasi bawaan Flutter, MyHomePage dibuat sebagai StatefulWidget karena bertugas mengelola variabel penghitung angka (_counter) yang berubah-ubah saat tombol ditekan.


5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?

BuildContext adalah objek yang digunakan oleh Flutter untuk menyediakan informasi mengenai lokasi suatu widget di dalam widget tree.

BuildContext sangat berguna ketika ingin meneruskan data dari parent ke child tanpa harus meng-assign data secara manual ke setiap konfigurasi widget yang ada. Metode build mendapatkan lingkungan konteks yang penting untuk membuat widget melalui parameter BuildContext dan mengembalikan widget yang ada.


6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

Hot reload adalah suatu fitur pada Flutter yang memungkinkan kita untuk menginjeksi perubahan kode pada aplikasi yang sedang berjalan (running app) tanpa harus me-restart seluruh aplikasi. Hot reload membantu untuk melihat perubahan UI secara instan. Hot reload bekerja lebih cepat dibandingkan hot restart. Ketika mengubah fungsi main(), mengubah variabel global, memperbarui constructor, atau menambah package dan dependensi baru, maka diperlukan hot restart atau full restart.


```Referensi```

(1) https://medium.com/@paudyal.gaurab11/passing-data-from-child-widget-to-parent-widget-in-flutter-3650e7d5c41e

(2) https://rcoding.rakryan.id/articles/stateless-vs-stateful-widget-di-flutter-kapan-pakai-yang-mana

(3) https://stackoverflow.com/questions/49100196/what-does-buildcontext-do-in-flutter

(4) https://medium.com/@lijith006/flutter-hot-reload-vs-hot-restart-what-they-are-and-when-to-use-them-a-beginners-guide-b134ca1bf7db

(5) https://medium.com/fludev/understanding-the-flutter-materialapp-widget-a-complete-guide-8247b0e68cb5


```AI Disclosure```

Pengerjaan Tugas 7 dikerjakan dengan mengikuti langkah yang tertera di tutorial 08, tanpa penggunaan AI.



### Tugas 8


1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.

— Method push() MENAMBAHKAN suatu route ke dalam stack route yang dikelola oleh Navigator. Method ini menyebabkan route yang ditambahkan berada pada paling atas stack, sehingga route yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.

— Method pushReplacement() MENGHAPUS route yang sedang ditampilkan kepada pengguna dan MENGGANTI dengan suatu route. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke suatu route yang diberikan. Pada stack route yang dikelola Navigator, route lama pada atas stack akan digantikan secara langsung oleh route baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.

— Perbedaan push() dan pushReplacement() terletak pada apa yang dilakukan kepada route yang berada pada atas stack. push() akan menambahkan route baru di atas route yang sudah ada pada atas stack, sedangkan pushReplacement() menggantikan route yang sudah ada pada atas stack dengan route baru tersebut. Jika kondisi stack kosong dan kita menekan tombol Back pada gawai, maka sistem akan keluar dari aplikasi tersebut.

— Method pop() MENGHAPUS route yang sedang ditampilkan kepada pengguna (atau dalam kata lain, route yang berada pada paling atas stack) dari stack route yang dikelola oleh Navigator. Method ini menyebabkan aplikasi untuk berpindah dari route yang sedang ditampilkan kepada pengguna ke route yang berada di bawahnya pada stack yang dikelola Navigator. Sederhananya, Navigator.pop() digunakan untuk kembali ke halaman sebelumnya

— Metode yang digunakan untuk membuka formulir dari kartu aksi adalah push(). Contoh Kode sebagai berikut (project_card.dart)

|  // Navigate ke halaman yang sesuai
|  if (item.name == "Tambah Proyek") {
|  Navigator.push(context,
|  MaterialPageRoute(builder: (context) => const ProjectFormPage()));
|  } 

— Alur opsi Home di drawer membawa pengguna kembali ke halaman utama

|  // --- HOMEPAGE ---
|  ListTile(
|  leading: const Icon(Icons.home_outlined),
|  title: const Text('Home'),
|  // Navigasi ke halaman utama portofolio
|  onTap: () {
|      Navigator.pushReplacement(
|      context,
|      MaterialPageRoute(
|          builder: (context) => MyHomePage(),
|      ),
|      );
|  },
|  ),

Navigator.pushReplacement() mengganti halaman/rute yang sedang aktif saat ini dengan MyHomePage() baru. Pada menu Home, pushReplacement langsung mengganti halaman aktif sehingga tidak menumpuk MyHomePage secara berulang di navigation stack. Builder (context) => MyHomePage() menginstansiasi ulang MyHomePage dengan transisi halaman standar Material Design. Karena Drawer berada di atas rute halaman aktif pada tumpukan navigasi, penggantian rute dengan pushReplacement sekaligus menutup tampilan drawer sehingga pengguna langsung melihat halaman utama.


2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

Scaffold merupakan widget yang menyediakan struktur dasar untuk aplikasi Flutter. Dengan Scaffold, penambahan elemen UI seperti AppBar dan Drawer menjadi lebih mudah. AppBar sendiri digunakan sebagai bilah aplikasi di bagian atas layar. Gunanya untuk menampilkan judul aplikasi dan ikon navigasi. Penggabungan Scaffold dan Appbar menciptakan struktur aplikasi yang lengkap.

Drawer adalah panel menu yang muncul di samping layar aplikasi (menu navigasi samping). Untuk membuka menu tersebut, pengguna harus menggeser layar ke kiri atau ke kanan, sesuai dengan tindakan yang telah ditentukan. Ikon untuk membuka drawer juga secara otomatis disediakan pada AppBar pada posisi tertentu. Tindakan membuka drawer juga sudah diatur secara otomatis oleh komponen Scaffold.

Contoh penggunaan warna tema portofolio di lebih dari satu halaman yakni terdapat di menu.dart, dimana tema aplikasi didefinisikan secara terpusat melalui ThemeData. Warna dari Theme.of(context).colorScheme ini bisa dipakai kembali di lebih dari satu halaman agar identitas warna portofolio tetap selaras.

|  appBar: AppBar(
|      title: const Text(
|          'MyPortfolio',
|          style: TextStyle(
|          color: Colors.white,
|          fontWeight: FontWeight.bold,
|          ),
|      ),
|      backgroundColor: Theme.of(context).colorScheme.primary,
|      iconTheme: const IconThemeData(color: Colors.white)
|  ),

3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.

Kombinasi tata letak tersebut memudahkan pengembangan aplikasi yang terstruktur dan user-friendly. Widget pengatur jarak berfungsi untuk mencegah overflow, memaksa elemen-elemen untuk mengecil atau mengisi sisa ruang yang ada, sehingga tidak melebihi batas layar. Saat jumlah konten melebihi tinggi atau lebar fisik layar di halaman formulir, widget penggulir memungkinkan pengguna menggulir layar ke atas atau bawah sehingga kolom input tidak tertutup keyboard dan tidak memicu error (munculnya garis-garis miring berwarna kuning hitam).


4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

GlobalKey merepresentasikan suatu key yang bersifat unik, gunanaya untuk mengidentifikasi secara unik tiap elemen dan menyediakan akses ke objek yang berasosiasi dengan elemen tersebut. FormState sendiri adalah sub-class dari State, yang merepresentasikan state yang berasosiasi dengan form. FormState dapat digunakan untuk menyimpan (save), me-reset, dan memvalidasi setiap FormField di dalam Form.
Validator digunakan untuk memvalidasi isi TextFormField dan mengembalikan pesan error apabila input tidak memenuhi ketentuan. Sementara validate() akan menjalankan validasi terhadap seluruh field yang memiliki validator saat tombol Simpan ditekan.

Contoh nilai yang ditolak oleh validasi yaitu ketika input kosong atau hanya berisi spasi pada field wajib seperti Nama Proyek atau Deskripsi Proyek.

Memilih jenis input (keyboardType) atau papan ketik saja belum cukup, karena itu hanyamemberi saran papan ketik dan tidak membatasi input. Mengatur keyboardType hanya mengarahkan tampilan tata letak soft keyboard yang sesuai. Pengguna tetap bisa memasukkan spasi kosong karena pengaturan ini tidak menolak submisi input yang tidak sesuai, atau pun memberi umpan balik error.


```Referensi```

(1) https://medium.com/@basriumar/scaffold-dan-appbar-membuat-struktur-aplikasi-flutter-part-10-43cb93d145a2

(2) https://stackoverflow.com/questions/73462472/what-is-the-meaning-of-the-formstate-syntax-in-the-globalkeyformstate


``` AI Disclosure ```

Pengerjaan Tugas Individu 8 ini dilakukan dengan bantuan Google - AI Mode. Pertanyaan yang diajukan adalah mengenai bagaimana menampilkan input form dalam bentuk tanggal, dan pada tugas ini input tersebut diimplementasiakn dalam Experience Form. Dimulai dari tipe data apa yang digunakan untuk mendeklarasikan variabel awalnya, bagaimana mengatur format tampilannya, hingga bagaimana menampilkan data penanggalan ketika pengguna meng-klik tombol Simpan.

Tautan: https://share.google/aimode/U2duZ2Zwb1Xn9JVNF



_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

A new Flutter project.

### Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
