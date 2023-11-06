## Nama    : Reyhan Zada Virgiwibowo
## NPM     : 2206081723
## Kelas   : PBP C

<details>
<summary><b>Tugas 7</b></summary>

## 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

### Stateless Widgets:

- `Stateless Widget` dapat dikatakan sebagai widget statis yang berarti widget tersebut tidak berubah. Ketika sudah dibuat, widget-widget ini bersifat tidak berubah (immutable), yang berarti bahwa perubahan pada variabel, ikon, tombol, atau pengambilan data tidak akan memengaruhi keadaan aplikasi. Beberapa contohnya adalah Text, Icon, dan Image.

### Stateful Widgets:

- `Stateful Widget` merupakan widget yang dinamis. Statefuk widget dapat merubah tampilannya sesuai response dari events yang dipicu baik dari interaksi user maupun adanya variabel atau nilai baru yang didapat. Hal ini berarti bahwa keadaan aplikasi dapat berubah beberapa kali bergantung pada berbagai variabel, masukan, dan data. Stateful Widgets digunakan ketika antarmuka pengguna dapat berubah secara dinamis. Beberapa contohnya adalah CheckBox, RadioButton, Form, dan TextField.

## 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

### Berikut adalah seluruh widget yang saya gunakan beserta fungsinya :
- `MyHomePage`: Widget utama yang berfungsi untuk mengatur struktur dari tampilan halaman utama
- `InventoryCard`: Widget untuk meletakkan setiap card tombol pada grid, menampilkan icon, text, warna, dan merespons interaksi pengguna dengan menampilkan SnackBar
- `Scaffold`: Membungkus halaman utama aplikasi dengan fitur seperti AppBar, body, dsb
- `ScaffoldMessenger`: Merupakan widget yang memungkinkan widget lain untuk menampilkan SnackBar, BottomSheet, dll., tanpa memerlukan akses langsung ke Scaffold
- `AppBar`: Menampilkan judul aplikasi dan fitur terkait app bar
- `SingleChildScrollView`: Memungkinkan konten untuk discroll jika melebihi ukuran layar
- `Padding`: Menambahkan ruang kosong (padding) di sekitar elemen tertentu dalam tata letak antarmuka pengguna
- `Column`: Mengatur anak-anaknya secara vertikal, sehingga widget ditempatkan satu per satu dari atas ke bawah
- `GridView`: Menampilkan anak-anaknya dalam bentuk grid dengan jumlah kolom yang ditentukan, memungkinkan penempatan widget dalam grid
- `Text`: Menampilkan teks
- `Icon`: Menampilkan ikon grafis.
- `Material`: Menerapkan efek material design pada widgetnya
- `InkWell`: Membuat area responsif ketika disentuh
- `Container`: Menyusun anak-anaknya dan memungkinkan konfigurasi padding, warna, dsb
  
## 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

- Membuat proyek Flutter baru bernama `lontongistic` dengan menjalankan perintah `flutter create lontongistic`
- Membuat file baru `menu.dart` pada folder `lib` dan membuat Stateless Widget `MyHomePage` dengan menambahkan potongan kode berikut ke `menu.dart` :
```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lontongistic',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Lontongistic', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
- Mengimport `menu.dart` ke `main.dart` dan mengedit `main.dart` agar menjalankan `menu.dart` saat aplikasi dijalankan
```dart
import 'package:flutter/material.dart';
import 'package:lontongistic/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lontongistic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
- Membuat class untuk membuat button di `menu.dart`
```dart
...
class InventoryItem {
  final String name;
  final IconData icon;
  final Color color;

  InventoryItem(this.name, this.icon, this.color);
}
...
```
- Membuat button `Lihat Produk`, `Tambah Produk`, dan `Logout` serta mengumpulkannya ke dalam suatu list di dalam MyHomePage
```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<InventoryItem> items = [
      InventoryItem("Lihat Produk", Icons.checklist, Colors.red),
      InventoryItem("Tambah Produk", Icons.add_shopping_cart, Colors.yellow),
      InventoryItem("Logout", Icons.logout, Colors.green),
    ];
...
...
```
- Membuat Widget `InventoryCard` sebagai struktur dari button `InventoryItem`
```dart
class InventoryCard extends StatelessWidget {
  final InventoryItem item;
  const InventoryCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
- Menambahkan `Gridview.count` pada widget `SingleChildScrollView` di dalam `MyHomePage` untuk menampilkan setiap tombol dalam bentuk grid dan menghubungkan tombol-tombol pada list `items` dengan widget `InventoryCard`.
```dart
class MyHomePage extends StatelessWidget {
...
Widget build(BuildContext context) {
  ...
  body: SingleChildScrollView(
    ....
     GridView.count(
        // Container pada card kita.
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: items.map((InventoryItem item) {
          // Iterasi untuk setiap item
          return InventoryCard(item);
        }).toList(),
      ),
```

- Memunculkan `Snackbar` yang memuat tulisan "Kamu telah menekan tombol [Nama Tombol]" ketika tombol ditekan dengan menambahkan fungsi `onTap` pada `InkWell` di dalam InventoryCard yang akan memunculkan`SnackBar` dengan fungsi `showSnackBar` pada saat tombol ditekan
```dart
class InventoryCard extends StatelessWidget {
...
  child: InkWell(
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
...
```

</details>
