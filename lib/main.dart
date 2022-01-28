import 'package:esolutions/model/user.dart';
import 'package:esolutions/view/create_account_page.dart';
import 'package:esolutions/view/home_page.dart';
import 'package:esolutions/view/routes/app_pages.dart';
import 'package:esolutions/view/routes/app_routes.dart';
import 'package:esolutions/viewmodel/auth_bindings.dart';
import 'package:esolutions/viewmodel/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().whenComplete(() => print("Done"));
  } on Exception catch (e) {
    print(e.toString());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eMagine Solutions',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends GetView<LoginController> {
  String email = "";
  String password = '';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return GetMaterialApp(
        initialBinding: InitialBindings(),
        getPages: AppPages.pages,
        home: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("eMagine Solutions"),
          ),
          body: SingleChildScrollView(
            child: Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Email :',
                  ),
                  Container(
                      margin: const EdgeInsets.all(15),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email address',
                        ),
                        onChanged: (text) {
                          controller.email.value = text;
                        },
                      )),
                  const Text(
                    'Password :',
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'password',
                      ),
                      onChanged: (text) {
                        controller.password.value = text;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                    color: Colors.blue,
                    child: InkWell(
                      child: const Text(
                        'Login',
                      ),
                      onTap: () async {
                        AppUser user = AppUser(email: controller.email.value, password: controller.password.value);
                        controller.loginUser(userInfo: user);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                    color: Colors.green,
                    child: InkWell(
                      child: const Text(
                        'Create account',
                      ),
                      onTap: () {
                        Get.toNamed(AppRoutes.CRETE_ACCOUNT);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                    color: Colors.yellow,
                    child: InkWell(
                      child: const Text(
                        'Sign-up with GOOGLE account',
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        controller.loginWithGoogle();
                      },
                    ),
                  )
                ],
              ),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
