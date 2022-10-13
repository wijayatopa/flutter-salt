part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Menambahkan 2 TextEditingController (Email dan Password)
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  //Tambahkan 1 boolean untuk login proses
  bool isLoginProcessing = false;

  Widget _buildRowText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'WELCOME',
          style: TextStyle(
            fontSize: 25,
          ),
        )
      ],
    );
  }

  Widget _buildPictureLogo(Size size) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://media-exp1.licdn.com/dms/image/C510BAQGy3oW6l2gXig/company-logo_200_200/0/1582168743193?e=2147483647&v=beta&t=xdM1U46coGLf3gJ5W8b4ccypkgdcyADSKfJYC3f3yDw',
            width: 100,
            height: 100,
          ),
          Text(
            'Salt-Commerce',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pink[800]),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController newController,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: newController,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const Text(
          //   'Login',
          //   style: TextStyle(
          //       color: Colors.black87,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 25),
          // ),
          const SizedBox(height: 24),
          _buildRowText(),
          _buildPictureLogo(size),
          _buildTextField('Email', emailController),
          _buildTextField('Password', passController, isPassword: true),
          const SizedBox(height: 24),
          ButtonWidget(
            onPressed: () async {
              //Untuk init si storage
              final SharedPreferences storage = await prefs;

              setState(() {
                isLoginProcessing = true;
              });

              Future.delayed(const Duration(milliseconds: 3000), () {
                //Jika emailnya adalah nama@gmail.com dan passwordnya 12345678
                //Maka diarahkan ke ListScreen
                if (emailController.text == "topa@gmail.com" &&
                    passController.text == '12345678') {
                  //Simpan Session
                  storage.setBool('pernah_login', true);

                  //Arahkan ke ListScreen
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListScreen(),
                      ));

                  setState(() {
                    isLoginProcessing = false;
                  });
                } else {
                  setState(() {
                    isLoginProcessing = false;
                  });
                  storage.setBool('pernah_login', false);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Login Gagal')));
                }

                //Jika tidak, maka muncul snackbar
              });
            },
            isLoading: isLoginProcessing,
            caption: 'Login',
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or Continue With',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
