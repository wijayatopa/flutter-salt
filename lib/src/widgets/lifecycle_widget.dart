part of 'widgets.dart';

class LifecycleWidget extends StatefulWidget {
  final Widget child;

  const LifecycleWidget({super.key, required this.child});

  @override
  State<LifecycleWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print('AppLifecycleState: $state');
    if (state == AppLifecycleState.detached) {
      print('Selamat Tinggal');
    } else if (state == AppLifecycleState.paused) {
      print('Aplikasi di Pause');
    } else if (state == AppLifecycleState.resumed) {
      print('Selamat datang kembali');
    } else if (state == AppLifecycleState.inactive) {
      print('Applikasi InActive');
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
