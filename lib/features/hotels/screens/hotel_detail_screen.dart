import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../models/hotel.dart';
import '../models/booking.dart';
import '../stores/hotel_detail_store.dart';

class HotelDetailScreen extends StatelessWidget {
  final Hotel hotel;

  const HotelDetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final store = HotelDetailStore();
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Забронировать')),
      body: Observer(builder: (_) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: hotel.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                  hotel.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 8),
              Text(hotel.description),
              const SizedBox(height: 16),
              Text('Цена: ${hotel.price} ₽ / ночь', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                onChanged: store.setGuests,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.people),
                  labelText: 'Количество гостей',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              GestureDetector(
                onTap: () async {
                  final now = DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: now,
                    lastDate: DateTime(now.year + 1),
                  );
                  if (picked != null) store.setDate(picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Дата',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  ),
                  child: Text(
                    store.date == null
                        ? "Выберите дату"
                        : "${store.date!.day}.${store.date!.month}.${store.date!.year}",
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  onPressed: store.canConfirm
                      ? () {
                    final booking = Booking(
                      hotelName: hotel.name,
                      city: hotel.city,
                      price: hotel.price,
                      guests: store.guests!,
                      date: store.date!,
                    );
                    context.pop(booking);
                  }
                      : null,
                  child: const Text('Подтвердить бронирование'),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

