import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/booking_store.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingStore = context.watch<BookingStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('История бронирования'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (bookingStore.history.isEmpty) {
            return const Center(child: Text("Вы пока ничего не бронировали"));
          }
          return ListView.builder(
            itemCount: bookingStore.history.length,
            itemBuilder: (context, index) {
              final booking = bookingStore.history[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              booking.hotelName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Город: ${booking.city}', style: TextStyle(color: Colors.grey[600])),
                            Text('Гостей: ${booking.guests}', style: TextStyle(color: Colors.grey[600])),
                            Text('Дата: ${booking.date.day}.${booking.date.month}.${booking.date.year}', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                      Text('${booking.price} ₽', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (i) {
          switch (i) {
            case 0:
              context.go('/hotels');
              break;
            case 2:
              context.go('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Главная"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "История"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }
}

