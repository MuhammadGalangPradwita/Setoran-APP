

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_utilities/auth.dart';
import 'package:tubes_mobpro/tubes/api_utilities/pengguna.dart';
import 'package:tubes_mobpro/tubes/models/pengguna.dart';
import 'package:tubes_mobpro/tubes/pages/get_started_page.dart';
import 'package:tubes_mobpro/tubes/widgets/bottom_nav.dart';

class AuthState extends ChangeNotifier {
  static Pengguna? _currentUser = null;

  Pengguna? get currentUser => _currentUser;

  static Pengguna? _dummy = null; // dummy account kalau gak mau harus pake server
  static set dummy(val) {
    _dummy = val;
  }

  Future<Pengguna?> refreshCurrentUser() async {
    _currentUser = await PenggunaApi.getCurrentUser();

    // dummy
    if (_dummy != null && _currentUser == null)
      _currentUser = _dummy;

    notifyListeners();

    return _currentUser;
  }

  Future<void> logout() async {
    await AuthApi.logout();
    _dummy = null;
    _currentUser = null;
    notifyListeners();
  }
}

class AuthCheck extends StatefulWidget {
  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pengguna?>(
      future: Provider.of<AuthState>(context, listen: false).refreshCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while checking auth
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          // Handle errors if needed
          return Scaffold(
            body: Center(
              child: Text("Something went wrong!"),
            ),
          );
        } else {

          // Navigate to the appropriate screen based on auth status
          return Consumer<AuthState>(builder: (context, auth, child) {
            // masih bisa klik back habis logout, gak tau harus di apain
            if (auth.currentUser != null)
              // WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              //         builder: (context) => BottomNav()),
              //         (route) => false, // Removes all previous routes
                // )); // kalau pake pushAndRemoveUntil malah jadi gak redirect habis beres login
              WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BottomNav())));
            else
              // WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              //         builder: (context) => GetStartedPage()),
              //         (route) => false, // Removes all previous routes
              //   ));
              WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GetStartedPage())));

            return Container();
          });
          
          // MultiProvider(
          //     providers: [
          //       ChangeNotifierProvider.value(
          //         value: AuthState(),
          //       ),
          //     ],
          //       child: Consumer<AuthState>(builder: (context, auth, child) {
          //         return (auth.currentUser != null ? BottomNav() : GetStartedPage());
          //     })
          // );
          // Provider(
          //   create: (context) => ChangeNotifierProvider.value(value: AuthState()),
          //   child: Consumer<AuthState>(builder: (context, auth, child) {
          //     return (auth.currentUser != null ? BottomNav() : GetStartedPage());
          //   })
          //   // child: GetStartedPage()
          //   // ,
          // );
        }
      },
    );
  }
}