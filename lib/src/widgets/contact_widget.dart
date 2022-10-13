part of 'widgets.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel data;

  const ContactWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            data.imageUrl,
            fit: BoxFit.cover,
            width: 46,
            height: 46,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(data.phone),
          ],
        )
      ]),
    );
  }
}
