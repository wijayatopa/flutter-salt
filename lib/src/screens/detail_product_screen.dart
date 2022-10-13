part of 'screens.dart';

class DetailProductScreen extends StatelessWidget {
  final int productId;

  const DetailProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Product'),
          backgroundColor: Colors.green,
        ),
        body: FutureBuilder<http.Response>(
            future: http
                .get(Uri.parse("https://fakestoreapi.com/products/$productId")),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                final detailProduct =
                    detailProductModelFromJson(snapshot.data!.body);
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        detailProduct.image!,
                        width: double.infinity,
                        height: 250,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        detailProduct.title!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        "Rp.${detailProduct.price!}0",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        detailProduct.description!,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(FontAwesomeIcons.heart)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(FontAwesomeIcons.cartShopping)),
                        ],
                      )
                    ],
                  ),
                );
              }
              return Container();
            }));
  }
}
