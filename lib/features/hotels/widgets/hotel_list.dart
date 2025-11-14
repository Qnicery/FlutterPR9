import 'package:flutter/material.dart';
import '../models/hotel.dart';
import 'hotel_card.dart';

class HotelList extends StatelessWidget {
  final List<Hotel> hotels;
  final void Function(Hotel) onBook;

  const HotelList({super.key, required this.hotels, required this.onBook});

  @override
  Widget build(BuildContext context) {
    if (hotels.isEmpty) {
      return const Center(child: Text('Нет отелей'));
    }

    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        return HotelCard(hotel: hotels[index], onBook: onBook);
      },
    );
  }
}