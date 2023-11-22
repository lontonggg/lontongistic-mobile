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
<details>
<summary><b>Tugas 9</b></summary>

## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa, kita dapat mengambil data JSON tanpa membuat model dengan menggunakan tipe data Map<String, dynamic> pada flutter untuk mengambil data JSON secara dinamis, namun cara ini dapat dikatakan kurang efekti karena tidak ada pengecekan tipe data selama pengambilan data JSON. Pembuatan model akan memperjelas struktur data yang diambil dari JSON, dan meningkatkan keamanan saat kompilasi, dan mempermudah pengelolaan data.

## 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest merupakan salah satu bagian dari http package pada Flutter yang digunakan untuk mengelola permintaan HTTP. CookieRequest dapat mengatur dan menyimpan informasi tentang cookie, yang kemudian dapat digunakan untuk berinteraksi dengan server. Alasan mengapa instance CookieRequest perlu dibagikan ke semua komponen pada aplikasi Flutter adalah agar semua komponen di aplikasi Flutter dapat berbagi informasi cookie yang sama dan mencegah adanya kesalahan dalam managemen cookie.

## 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

- Menggunakan http.Client untuk membuat permintaan HTTP (GET atau POST) ke server.
- Menerima data dan mendeserialisasi JSON dari server.
- Membuat model atau parsing dinamis untuk mengonversi data JSON menjadi objek Dart.
- Menampilkan data dari objek dalam widget Flutter.

## 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

- Pengguna memasukan informasi akun seperti username dan password yang akan diambil oleh aplikasi Flutter
- Aplikasi flutter akan mengirikan permintaan melalui HTTP POST ke server Django yang berisi informasi pengguna
- Server Django akan menerima dan melakukan proses autentikasi serta validasi akun. Jika valid, maka Django akan membuat token sesi untuk dikirimkan kepada aplikasi Flutter.
- Aplikasi Flutter akan menerima token sesi dari server Django dan disimpan untuk penggunaan selanjutnya.
- Setelah tahap autentikasi berhasil, aplikasi Flutter akan kembali ke halaman utama menggunakan Navigator dan menampilkan halaman dengan informasi yang sesuai kepada pengguna.

## 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

- `Scaffold`: Struktur dasar halaman

- `Container` : Bisa mengatur padding, margin, background, ukuran, dll. Berfungsi untuk menyimpan elemen-elemen secara flexible

- `AppBar`: Menampilkan judul aplikasi dan mengatur warna latar belakang serta teks.

- `ElevatedButton`: Membuat tombol dengan tampilan yang lebih tinggi.

- `Form`: Membungkus elemen-elemen input untuk validasi dan manipulasi data.

- `TextFormField`: Mengambil input teks dari pengguna.

- `Text`: Menampilkan teks.

- `Drawer`: Menyediakan struktur untuk menu navigasi.

- `Column`: Menempatkan widgets atau item secara vertikal.

- `ListView`: Mengatur agar semua widget-widget dapat di-scroll.

- `ListTile`: Item dalam ListView

- `Navigator`: Menangani perpindahan halaman saat item menu dipilih.

- `MaterialPageRoute`: Mengatur transisi antar halaman.

- `Material`: Lapisan dasar untuk InkWell dengan efek elevasi dan respons sentuhan.

- `InkWell`: Area responsif terhadap sentuhan dengan efek visual.

- `Container`: Menyimpan ikon dan teks dengan memberikan jarak dan mengatur tata letak.

- `Card`: Mengelompokkan informasi item dalam tampilan kartu dengan bayangan dan sudut bulat.

- `CircularProgressIndicator`: Indikator loading sementara data produk diambil.

- `SingleChildScrollView`: Memberikan kemampuan scroll pada halaman.

- `GridView.count`: Tata letak grid dengan jumlah kolom yang dapat diatur.

- `Future`: Representasi nilai atau kesalahan yang mungkin terjadi di masa depan.

- `FutureBuilder`: Mengelola state Future untuk menangani data asynchronous.

## 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

### Membuat halaman login pada proyek tugas Flutter dan Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

- Membuat `django-app` baru bernama `authentication` dan menambahkan app tersebut ke dalam `INSTALLED_APPS` pada settings.py di folder project utama
- Menginstall `django-cors-headers` dan menambahkannya juga ke `INSTALLED_APPS` pada settings.py di folder project utama
- `Menambahkan `'corsheaders.middleware.CorsMiddleware'` dan juga variabel-variabel berikut ke settings.py
```python
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
``` 
- Membuat `views.py` pada app authentication yang berisi function untuk login
```python
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```
- Membuat file `urls.py` untuk URL routing pada folder `authentication` dan menambahkan path dari `urls.py` pada authentication ke urls.py pada folder project utama

urls.py pada folder authentication
```python
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```

urls.py pada folder project utama
```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('', include('main.urls')),
    path('auth/', include('authentication.urls')),
    path('admin/', admin.site.urls)
]
```

- Pada aplikasi Flutter, instal package berikut :
```
flutter pub add provider
flutter pub add pbp_django_auth
```

- Memodifikasi root widget pada main.dart agar `CookieRequest` tersedia untuk semua child widgets menggunakan `Provider`.
```dart
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Lontongistic',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
                    useMaterial3: true,
                ),
                home: LoginPage(),
            ),
        );
    }
}
```

- Membuat file `login.dart` pada folder screen sebagai halaman untuk login
```dart
// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:lontongistic/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("https://reyhan-zada-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```
### Membuat model kustom sesuai dengan proyek aplikasi Django.

- Mengambil endpoint JSON pada tugas sebelumnya dengan menjalankan `localhost:8000/json` setelah menjalankan server, dan menggunakan website `Quicktype` untuk mengubahnya kedalam bahasa Dart.

- Membuat folder baru bernama `models` dan membuat file `item.dart` sebagai model dan menambahkan kode dari website `Quicktype`:

```dart
// To parse this JSON data, do
//
//     final Item = ItemFromJson(jsonString);

import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    String description;
    String category;
    DateTime dateAdded;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
        required this.category,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        category: json["category"],
        dateAdded: DateTime.parse(json["date_added"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
        "category": category,
        "date_added": dateAdded.toIso8601String(),
    };
}
```
- ### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

- Menambahkan package http dengan menjalankan `flutter pub add http` pada terminal Flutter

- Menambahkan kode berikut untuk memperbolehkan akses Internet pada aplikasi Flutter yang akan dibuat :

```xml
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```

- Memuat file `list_item.dart` pada `lib/screens` dan import library yang diperlukan sehingga berisi seperti berikut :

  ```dart
  // ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import 'package:lontongistic/models/item.dart';
  import 'package:lontongistic/screens/detail_item.dart';
  import 'package:lontongistic/widgets/left_drawer.dart';

  class ItemPage extends StatefulWidget {
      const ItemPage({Key? key}) : super(key: key);

      @override
      _ItemPageState createState() => _ItemPageState();
  }

  class _ItemPageState extends State<ItemPage> {
  Future<List<Item>> fetchitem() async {
      var url = Uri.parse(
          'https://reyhan-zada-tugas.pbp.cs.ui.ac.id/json/');
      var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object item
      List<Item> list_item = [];
      for (var d in data) {
          if (d != null) {
              list_item.add(Item.fromJson(d));
          }
      }
      return list_item;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: const Text('Item'),
          ),
          drawer: const LeftDrawer(),
          body: FutureBuilder(
              future: fetchitem(),
              builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                  } else {
                      if (!snapshot.hasData) {
                      return const Column(
                          children: [
                          Text(
                              "There's no item.",
                              style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                          ],
                      );
                  } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(builder: (context) => DetailItem(snapshot.data![index])))
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Text(
                                          "${snapshot.data![index].fields.name}",
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                          ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text("Amount : ${snapshot.data![index].fields.amount}"),
                                      ],
                                      ),
                                  )
                              ));
                      }
                  }
              }));
      }
  }
  ```
 - Mengubah fungsi tombol `Lihat Produk` pada `inventory_button.dart` agar melakukan redirection ke halaman `ProductPage` :

  ```dart
  else if(item.name == "Your Inventory") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemPage()));
            }
  ```

  -  ### Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.
  ```dart
   child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Text(
        "${snapshot.data![index].fields.name}",
        style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(height: 10),
        Text("Amount : ${snapshot.data![index].fields.amount}"),
    ],
    ),
  ```

- ### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
  - Membuat file baru pada folder `screens` bernama `detail_item.dart` yang berisi details dari item:
  ```dart
    // ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

  import 'package:flutter/material.dart';
  import 'package:lontongistic/models/item.dart';
  import 'package:lontongistic/screens/list_item.dart';
  import 'package:lontongistic/widgets/left_drawer.dart';

  class DetailItem extends StatelessWidget {
    final Item item;

    const DetailItem(this.item, {super.key});

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lontongistic',
          ),
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
        ),
        drawer: LeftDrawer(),
        body: Padding(
          padding: EdgeInsets.all(5),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height : 10),
              Text("Amount : ${item.fields.amount}"),
              Text("Category : ${item.fields.category}"),
              Text("Date Added : ${item.fields.dateAdded}"),
              const SizedBox(height: 10),
              Text("${item.fields.description}"),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightGreen),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ItemPage()));
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ), 
        )
      );
    }
  }
  ```
  - ### Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
  
  - Membuat tombol untuk pergi ke halaman `detail_item.dart` pada `list_item.dart`:
  ```dart
  child: InkWell(
    onTap: () => {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => DetailItem(snapshot.data![index])))
    },
  )
  ```
  - ### Tampilkan seluruh atribut pada model item kamu pada halaman ini.
    ```dart
    body: Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height : 10),
          Text("Amount : ${item.fields.amount}"),
          Text("Category : ${item.fields.category}"),
          Text("Date Added : ${item.fields.dateAdded}"),
          const SizedBox(height: 10),
          Text("${item.fields.description}"),
        ],
      )
    )
    ```
  - ### Tambahkan tombol untuk kembali ke halaman daftar item.
  ```dart
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.lightGreen),
      ),
      onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => ItemPage()));
      },
        child: const Text(
        "Back",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ```


</details>







