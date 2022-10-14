part of 'widgets.dart';

class GridProductWidget extends StatelessWidget {
  final ProductModel product;

  const GridProductWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailProductScreen(productId: product.id!)));
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          child: Container(
            color: const Color.fromARGB(255, 247, 66, 49),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Image Network
                Hero(
                    tag: product.id!,
                    child: Image.network(
                      product.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      //Text Nama Produk
                      Text(product.title!,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: true),
                      //Text Harga
                      Text(
                        "Rp.${product.price!}0",
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic),
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
