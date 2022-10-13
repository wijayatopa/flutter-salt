
import 'package:belajar_flutter/src/models/modelsName.dart';

class ProductSource {
  static List<Product> getProduct() {
    return _dummyProducts.map((e) => Product.fromJson(e)).toList();
  }

  static final _dummyProducts = [
    {
      "id": 1,
      "title": "FITBIT Charge 5 Fitness Tracker Smartwatch",
      "Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "url":
          "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/11/4/452d0d0c-7be6-4493-b4a2-9b6ec14ddea7.jpg.webp?ect=4g"
    },
    {
      "id": 2,
      "title": "reprehenderit est deserunt velit ipsam",
      "Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "url":
          "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2021/11/8/6936a4e5-72d1-4850-8f08-3c8da5fcd43c.jpg.webp?ect=4g"
    },
    {
      "id": 3,
      "title": "officia porro iure quia iusto qui ipsa ut modi",
      "Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "url":
          "https://images.tokopedia.net/img/cache/700/VqbcmM/2021/11/3/f7b85455-7f84-4bf3-8703-cec18bb947e1.jpg.webp?ect=4g"
    },
    {
      "id": 4,
      "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
      "Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "url":
          "https://images.tokopedia.net/img/cache/700/VqbcmM/2021/11/3/47a071ae-79ec-41d9-b7e7-372acd44c889.jpg.webp?ect=4g"
    },
    {
      "id": 5,
      "title": "natus nisi omnis corporis facere molestiae rerum in",
      "Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      "url":
          "https://images.tokopedia.net/img/cache/700/VqbcmM/2021/11/3/7c867281-3564-4c61-9379-258e77f33bda.jpg.webp?ect=4g"
    }
  ];
}