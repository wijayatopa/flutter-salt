part of 'screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  //mengambil sharedpreferences
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  //notification
  NotificationService notifService = NotificationService();

  Future<dynamic> onReceiveNotif(int id, String? title, String? body) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title!),
            content: Text(body!),
            actions: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Kamu Mendapatkan $body')));
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  void showNotif() {
    notifService.showNotif('Ada Promo nich buat kamu',
        'Mens Casual Slim Fit yang kamu inginkan turun harga 70%', '3');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notif akan muncul setelah 10 detik')));
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    //Fungsi menampilkan alert
    // showDialog(
    // context: context,
    // builder: (context) => AlertDialog(
    // title: Text('Kamu Cantik'),
    // actions: [
    // TextButton(
    // onPressed: () {
    // Navigator.pop(context);
    // },
    // child: Text('Close'))
    // ],
    // ));

    //Fungsi masuk ke halaman detail
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (context) => DetailProductScreen(
                productId: int.parse(payload!),
              )),
    );
  }

  @override
  void initState() {
    notifService.init((p0, p1, p2, p3) => onReceiveNotif(p0, p1, p3),
        onDidReceiveNotificationResponse);
    super.initState();
  }

  int bottomNavBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('List Product'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: showNotif, icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () async {
                SharedPreferences storage = await prefs;
                if (storage.getBool('pernah_login') == true) {
                  storage.clear().then((value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  });
                }
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        onTap: (value) {
          setState(() {
            bottomNavBarIndex = value;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          //Index ke 0
          const BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'ListView'),
          //Index ke 1
          const BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3), label: 'GridView'),
        ],
      ),
      body:
          // Perbandingan                 //Nilai True          //Nilai False
          (bottomNavBarIndex == 0) ? const ListProduct() : const GridProduct(),
    );
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: http.get(Uri.parse("https://fakestoreapi.com/products")),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          final products = productModelFromJson(snapshot.data!.body);
          return GridView(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 350,
            ),
            // mainAxisExtent: 250,
            children: products
                .map((e) => ListProductWidget(
                      product: e,
                    ))
                .toList(),
          );
        }
        return Container();
      },
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: http.get(Uri.parse("https://fakestoreapi.com/products")),
      builder: (context, snapshot) {
        //Widget ketika loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        //Widget ketika datanya di load
        if (snapshot.hasData) {
          final products = productModelFromJson(snapshot.data!.body);
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ListProductWidget(product: products[index]),
          );
        }
        return Container();
      },
    );
  }
}
