# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


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