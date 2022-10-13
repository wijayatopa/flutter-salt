part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 2000), () {
      checkLogin();
    });
    super.initState();
  }

  Future<void> checkLogin() async {
    final SharedPreferences storage = await prefs;
    if (storage.getBool('pernah_login') == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LifecycleWidget(child: ListScreen())));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Salt-Commerce',
              style: TextStyle(
                color: Colors.pink[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            CircularProgressIndicator(
              color: Colors.pink[800],
            ),
          ],
        ),
      ),
    );
  }
}
