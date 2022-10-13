part of 'widgets.dart';

//stless
class ButtonWidget extends StatelessWidget {
  final String caption; //isinya adalah Klik aku dong
  final bool isLoading;
  final double? width;
  final Function()? onPressed;

  const ButtonWidget(
      {super.key,
      required this.caption,
      this.isLoading = false,
      this.width,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //Ukuran Lebar layar/screen
    return Container(
      width: width ?? size.width,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.pink[800], //Warna Utama
            elevation:
                0.0, //Elevasi atau ketinggian button dari screen (shadow)
          ),
          onPressed: (isLoading) ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: (isLoading)
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.pink[600]),
                  )
                : Text(
                    caption,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
          )),
    );
  }
}
