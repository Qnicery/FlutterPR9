import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/hotel.dart';
import '../models/booking.dart';

class HotelDetailScreen extends StatefulWidget {
  final Hotel hotel;

  const HotelDetailScreen({super.key, required this.hotel});

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  final _guestsController = TextEditingController();
  DateTime? _selectedDate;

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  void _confirmBooking() {
    final guests = int.tryParse(_guestsController.text);
    if (guests == null || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите количество гостей и дату')),
      );
      return;
    }

    final booking = Booking(
      hotelName: widget.hotel.name,
      city: widget.hotel.city,
      price: widget.hotel.price,
      guests: guests,
      date: _selectedDate!,
    );

    context.pop(booking);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Забронировать', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: widget.hotel.imageUrl,
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
                widget.hotel.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 8),
            Text(widget.hotel.description),
            const SizedBox(height: 16),
            Text('Цена: ${widget.hotel.price} ₽ / ночь', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _guestsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.people),
                labelText: 'Количество гостей',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Дата заезда',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              ),
              child: GestureDetector(
                onTap: _pickDate,
                behavior: HitTestBehavior.opaque,
                child: Text(
                  _selectedDate == null
                      ? 'Выберите дату'
                      : '${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}',
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _confirmBooking,
                child: const Text('Подтвердить бронирование'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
