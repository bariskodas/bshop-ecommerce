import '../api/models/user_model.dart';
import 'api/get_products_riverpod.dart';
import '../api/services/services.dart';
import 'ui/bottom_nav_bar_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_riverpod.dart';

//* UI Riverpods
final bottomNavbarRiverpod =
    ChangeNotifierProvider((_) => BottomNavbarRiverpod());

//! API Riverpods
final apiProvider = Provider<ApiServices>((ref) => ApiServices());

final getProductsRiverpod =
    ChangeNotifierProvider((_) => GetProductsRiverpod());
    
final userProvider = FutureProvider<UserModel>((ref) async {
  return ref.read(apiProvider).getRandomUser();
});

//? Others
final cartRiverpod = ChangeNotifierProvider((_) => CartRiverpod());
