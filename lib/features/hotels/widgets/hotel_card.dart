import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/hotel.dart';

class HotelCard extends StatelessWidget{
  final Hotel hotel;
  final void Function(Hotel) onBook;

  const HotelCard({
    super.key,
    required this.hotel,
    required this.onBook
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
              imageUrl: hotel.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.broken_image,
                size: 60,
                color: Colors.grey,
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(hotel.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('${hotel.price.toStringAsFixed(0)} ₽/ночь'),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => onBook(hotel),
              child: const Text('Забронировать'),
            ),
          )
        ],
      ),
    );
  }
}