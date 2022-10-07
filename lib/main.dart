import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pagopa_test/home/home.dart';
import 'package:pagopa_test/home/home_binding.dart';
import 'package:pagopa_test/initial_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(
    host: "https://www.pivotaltracker.com/",
  );
}

void mainCommon({
  required String host,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[DeviceOrientation.portraitUp],
  );
  final InitialBinding initialBinding = InitialBinding(
    host,
  );
  runApp(PagoPA(
    initialBinding: initialBinding,
    host: host,
  ));
}

class PagoPA extends StatelessWidget {
  final String host;
  final InitialBinding initialBinding;
  const PagoPA({required this.initialBinding, required this.host, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PagoPA',
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("it", "IT"),
      initialBinding: initialBinding,
      initialRoute: "/home",
      getPages: <GetPage<Widget>>[
        GetPage<Widget>(
          name: "/home",
          page: () => const Home(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
