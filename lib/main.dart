import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '/features/hotels/screens/hotels_screen.dart';
import 'features/hotels/models/hotel.dart';
import 'features/hotels/screens/history_screen.dart';
import 'features/hotels/screens/hotel_detail_screen.dart';
import 'features/hotels/screens/profile_screen.dart';
import 'features/hotels/screens/settings_screen.dart';
import 'features/hotels/stores/booking_store.dart';
import 'features/hotels/stores/hotels_store.dart';
import 'features/hotels/stores/profile_store.dart';


final getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton(() => BookingStore());
  getIt.registerLazySingleton(() => HotelsStore());
  getIt.registerLazySingleton(() => ProfileStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/hotels',
      routes: [
        GoRoute(
          name: 'hotels',
          path: '/hotels',
          builder: (context, state) => const HotelsScreen(),
          routes: [
            GoRoute(
              name: 'hotelDetail',
              path: 'detail',
              builder: (context, state) {
                final hotel = state.extra as Hotel;
                return HotelDetailScreen(hotel: hotel);
              },
            ),
          ],
        ),
        GoRoute(
          name: 'history',
          path: '/history',
          builder: (context, state)=> const HistoryScreen(),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(
              name: 'settings',
              path: 'settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    );
    return MaterialApp.router(
        title: 'Бронирование отелей',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: _router,
      );
  }
}

