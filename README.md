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
<details>
<summary><b>Tugas 8</b></summary>

## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Method `push()` berfungsi untuk menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator sehingga route yang ditambahkan akan berada di posisi paling atas dari stack. Sedangkan method `pushReplacement()` berfungsi untuk menghapus route yang sedang ditampilkan dan menggantikannya dengan route yang diberikan. Method `pushReplacement()` akan menghapus route yang berada di posisi paling atas dari stack dan digantikan oleh route yang baru.

Contoh :
Pada aplikasi saya, jika saya menggunakan `pushReplacement()` untuk memunculkan route Add Item, maka jika saya menekan tombol Back saat berada di route Add Item, sistem akan keluar dari aplikasi. Hal ini dikarenakan route yang memunculkan Main Page akan digantikan oleh route dari Add item.

Membuka home page dengan pushReplacement.
```dart
Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => MyHomePage()));
```

Membuka form Add Item dengan push.
```dart
Navigator.push(context, MaterialPageRoute( builder: (context) => AddItemFormPage()));
```

## 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

`Container` : Bisa mengatur padding, margin, background, ukuran, dll. Berfungsi untuk menyimpan elemen-elemen secara flexible

`Row` : Digunakan untuk menempatkan widgets secara mendatar (Horizontal).

`Column` : Digunakan untuk menempatkan widgets secara vertikal. 

`Stack` : Digunakan untuk menempatkan widgets secara bertumpuk.

`ListView`: Mengatur agar semua widget-widget dapat di-scroll.

`GridView` : Menyusun widget-widet dalam bentuk grid dan ditampilkan dalam susunan baris dan kolom (Seperti tabel).

`Expanded / Flexible` : Digunakan dalam Row, Column, atau flex untuk meluaskan widget didalamnya.

`SizedBox` : Menyimpan dalam bentuk box yang memiliki ukuran widget yang telah ditentukan. Jika memiliki child, maka ia akan memiliki ukuran yang bergantung pada ukuran parentnya.

`Card` : Menampilkan widget dalam bentuk kartu, digunakan untuk menampilkan informasi yang terkelompok.

## 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Pada tugas ini, saya menggunakan `TextFormField` untuk mengambil input nama, jumlah, kategori, dan deskripsi dari item yang akan di simpan pada aplikasi saya. Alasan saya menggunakan TextFormField adalah karena widget ini memungkinkan pengguna untuk memasukkan teks dan juga dapat membantu menangani validasi data (Mengatasi data kosong atau data tidak valid).

## 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

Penerapan Clean Architecture pada aplikasi Flutter terdiri dari tiga lapisan utama: Domain Layer, Data Layer, dan Presentation Layer.

1. Presentation Layer (UI)
Presentation Layer berinteraksi langsung dengan pengguna dan berisi komponen-komponen User Interface seperti widgets, screens, dan views.

2. Domain Layer (Business Logic)
Domain Layer merepresentasikan "Business Logic" utama dari aplikasi dan biasanya berisi models dan methods. Pada layer ini lah data akan dioperasikan dan diolah.

3. Data Layer
Data Layer bertanggung jawab untuk menyediakan dan menyimpan data dari berbagai sumber seperti API, database, file lokal, dll.


## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

### 1. Membuat halaman form untuk menambahkan item ke Inventory

- Membuat file untuk form bernama `add_item_form.dart`

- Menggunakan `TextFormField` sebagai input untuk field `name`, `amount`, `category`, dan `description` serta melakukan validasi

```dart
Padding( // Input name
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Item Name",
      labelText: "Item Name",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _name = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Name cannot be empty!";
      }
      return null;
    },
  ),
),
Padding( // Input amount
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Amount",
      labelText: "Amount",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _amount = int.parse(value!);
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Amount cannot be empty!";
      }
      if (int.tryParse(value) == null) {
        return "Amount has to be an integer!";
      }
      return null;
    },
  ),
),
Padding( // Input category
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Category",
      labelText: "Category",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _category = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Category cannot be empty!";
      }
      return null;
    },
  ),
),
Padding( // Input description
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Description",
      labelText: "Description",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _description = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Description cannot be empty!";
      }
      return null;
    },
  ),
),
```

- Membuat tombol save untuk menyimpan item ke penyimpanan list pada `inventory_list.dart` 

```dart
// Tombol Save
child: ElevatedButton(
  style: ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all(Colors.lightGreen),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      InventoryList.items.add(Item(
        name: _name,
        amount: _amount,
        category: _category,
        description: _description,
      ));
    }
  }
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.white),
  ),
),
```

### 2. Mengarahkan pengguna ke halaman form saat menekan tombol `Add Item`

- Melakukan push saat button di tap menuju halaman form

```dart
onTap: () {
  ...
  // Navigate ke route yang sesuai (tergantung jenis tombol)
  if (item.name == "Add Item") {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddItemFormPage()));
  }
}
```

### 3. Memunculkan data sesuai dari form yang telah diisi

- Memunculkan popup message yang menunjukan data yang telah diisi pada form

```dart
// Jika tombol save di tekan
onPressed: () {
  if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Your item has been saved!'),
            content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text('Name: $_name'), // Memunculkan nama
                Text('Amount: $_amount'), // Memunculkan amount
                Text('Category: $_category'), // Memunculkan category
                Text('Description: $_description') // Memunculkan deskripsi
              ],
            ),
          ),
        )
      }
    ) 
  }
}

```

### 4.Menambahkan drawer untuk navigasi

- Membuat folder baru di dalam `lib` bernama `widgets` dan buat file baru bernama `left_drawer.dart`

- Membuat widget LeftDrawer yang memiliki 3 tombol untuk routing ke `Main Page`, `Add Item`, dan `Your Inventory`

```dart
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Column(
              children: [
                Text(
                  'Lontongistic',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  'Your digital inventory maestro!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Main Page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text('Add Item'),
            // Bagian redirection ke AddItemFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddItemFormPage(),
                ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Your Inventory'),
            // Bagian redirection ke InventoryList
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InventoryList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
```



</details>
