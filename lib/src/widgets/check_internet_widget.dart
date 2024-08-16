 import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:short_extensions/short_extensions.dart';

Future<bool> internetAvaliable() async {
  ConnectivityResult res = (await Connectivity().checkConnectivity()).first;
  if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

Future<bool> noInternetAvailable() async {
  return !(await internetAvaliable());
}

void onNetChanged({required ValueChanged<ConnectivityResult> onChanged}) {
  Connectivity()
      .onConnectivityChanged
      .listen((List<ConnectivityResult> results) {
    if ([ConnectivityResult.mobile, ConnectivityResult.wifi]
        .contains(results)) {
      onChanged(results.first);
    }
  });
}

Future<bool> checkInternetConnection() async {
  ConnectivityResult res = (await Connectivity().checkConnectivity()).first;
  if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

Future<bool> checkInternetConnectionWithSnakcbar(BuildContext context) async {
  ConnectivityResult res = (await Connectivity().checkConnectivity()).first;
  if (res == ConnectivityResult.mobile || res == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

class InternetStatusWidget extends StatelessWidget {
  final Widget? child;
  const InternetStatusWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
        stream: Connectivity().onConnectivityChanged,
        builder: (c, snap) {
          List<ConnectivityResult> results = snap.data ?? [];
          if (results.isEmpty) {
            return const SizedBox();
          }
          if (results.contains(ConnectivityResult.none)) {
            return Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: 12.circularBorder()),
                height:150,
                child: TextWidget.black(
                  text: "Please check internet connection",
                  maxLines: 3,
                  fontsize: 24,
                  fontweight: FontWeight.w600,
                ).applyHorizontalPadding(),
              ),
            );
          }
          return child ?? (const SizedBox());
        });
  }
}
