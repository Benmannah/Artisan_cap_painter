import 'package:artisan_cap_painter/models/user_model.dart';
import 'package:artisan_cap_painter/services/firebase_auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artisan_cap_painter/pages/home_page/home_page.dart';
import 'package:artisan_cap_painter/pages/welcome_page/welcome_page.dart';
import 'package:artisan_cap_painter/state_managers/location_data_state.dart';
import 'package:artisan_cap_painter/utils/app_colors.dart';
import 'package:artisan_cap_painter/services/firestore_services.dart';
import 'package:artisan_cap_painter/state_managers/user_data_state.dart';
import 'firebase_options.dart';
import 'models/category_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _initUser() async {
    // var categories = CategoryModel.dummyData;
    // //save categories to firestore
    // for (var category in categories) {
    //   var id = FireStoreServices.getCatId();
    //   category = category.copyWith(id: id);
    //   await FireStoreServices.addCategory(category);
    // }
    // List<UserModel> artisans = DummyData.artisanList();
    // for (var artisan in artisans) {
    //   var id = FireStoreServices.getUserId();
    //   artisan.id = id;
    //   artisan.createdAt = DateTime.now().millisecondsSinceEpoch;

    //   await FireStoreServices.saveUser(artisan);
    // }
    //await FirebaseAuthService.signOut();
    var location = ref.watch(locationStreamProvider);
    if (FirebaseAuthService.isUserLogin()) {
      var user = FirebaseAuthService.getCurrentUser();
      if (user != null) {
        //set user Online
        await FireStoreServices.setUserOnline(user.uid);
        UserModel userData = await FireStoreServices.getUserData(user.uid);
        if (userData.idNumber != null) {
          //update user location
          location.whenData((location) async {
            if (location.latitude != null && location.longitude != null) {
              userData = userData.copyWith(
                location: () => location.toMap(),
                latitude: () => location.latitude,
                longitude: () => location.longitude,
                city: () => location.city,
                region: () => location.region,
              );
              await FireStoreServices.updateUserLocation(userData);
            }
          });

          //check if widget is build
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.watch(userProvider.notifier).setUser(userData);
          });
          return true;
        } else {
          //sign ot
          
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ready Artisans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        indicatorColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.black87),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: const EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black87),
        canvasColor: primaryColor,
      ),
      builder: FlutterSmartDialog.init(),
      home: FutureBuilder<bool>(
          future: _initUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return const HomePage();
              } else {
                return const WelcomePage();
              }
            } else {
              return const Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
