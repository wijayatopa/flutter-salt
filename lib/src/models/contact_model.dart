part of 'models.dart';

class ContactModel {
  final String name;
  final String imageUrl;
  final String phone;

  ContactModel(this.name, this.imageUrl, this.phone);
}

List<ContactModel> contacts = [
  ContactModel(
      'Naruto',
      'https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656',
      '+62560000000'),
  ContactModel(
      'Sasuke',
      'https://static.wikia.nocookie.net/naruto/images/1/13/Sasuke_Part_2.png/revision/latest?cb=20170621055122&path-prefix=id',
      '+62560000000'),
  ContactModel(
      'Sikamaru',
      'https://static.wikia.nocookie.net/naruto/images/d/de/Shikamaru_Nara_Part_2.png/revision/latest?cb=20141208042050&path-prefix=id',
      '+62560000000'),
  ContactModel(
      'Sakura',
      'https://www.greenscene.co.id/wp-content/uploads/2020/05/Sakura-696x497.jpg',
      '+62560000000'),
  ContactModel(
      'Kakashi',
      'https://static.wikia.nocookie.net/naruto/images/e/e5/Kakashi_Hatake_Part_III.png/revision/latest?cb=20170629061743&path-prefix=id',
      '+62560000000'),
  ContactModel(
      'Minato',
      'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/08/27/4195828089.jpg',
      '+62560000000'),
  ContactModel(
      'Jiraya',
      'https://www.greenscene.co.id/wp-content/uploads/2021/04/Jiraiya.jpg',
      '+62560000000'),
  ContactModel(
      'Hasirama',
      'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2022/08/09/2981314125.jpg',
      '+62560000000'),
  ContactModel(
      'Madara',
      'https://www.greenscene.co.id/wp-content/uploads/2021/07/Naruto-4.jpg',
      '+62560000000'),
  ContactModel(
      'Itachi',
      'https://static.wikia.nocookie.net/naruto/images/b/bb/Itachi.png/revision/latest?cb=20151217131404&path-prefix=id',
      '+62560000000'),
];
