import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/get_started_page.dart';
import 'package:tubes_mobpro/tubes/widgets/bottom_nav.dart';

class AuthState extends ChangeNotifier {
  static Pengguna? _currentUser;

  Pengguna? get currentUser => _currentUser;

  static Pengguna? _dummy; // dummy account kalau gak mau harus pake server
  static set dummy(val) {
    _dummy = val;
  }

  Future<Pengguna?> refreshCurrentUser() async {
    try {
      _currentUser =
          await ApiService().penggunaApi.penggunaCurrentPenggunaGet();
    } catch (exp) {}

    // dummy
    if (_dummy != null && _currentUser == null) _currentUser = _dummy;

    notifyListeners();

    return _currentUser;
  }

  Future<void> logout() async {
    ApiService().removeToken();
    _dummy = null;
    _currentUser = null;
    notifyListeners();
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pengguna?>(
      future:
          Provider.of<AuthState>(context, listen: false).refreshCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while checking auth
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          // Handle errors if needed
          return Scaffold(
            body: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        } else {
          // Navigate to the appropriate screen based on auth status
          return Consumer<AuthState>(builder: (context, auth, child) {
            // masih bisa klik back habis logout, gak tau harus di apain
            if (auth.currentUser != null) {
              // WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              //         builder: (context) => BottomNav()),
              //         (route) => false, // Removes all previous routes
              // )); // kalau pake pushAndRemoveUntil malah jadi gak redirect habis beres login
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BottomNav())));
            } else {
              // WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              //         builder: (context) => GetStartedPage()),
              //         (route) => false, // Removes all previous routes
              //   ));
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GetStartedPage())));
            }
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
