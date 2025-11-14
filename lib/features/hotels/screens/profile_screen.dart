import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'User';

  void _openSettings() {
    context.push('/profile/settings');
  }

  void _changeName() {
    setState(() {
      userName = userName == 'User' ? 'Имя' : 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль', style: TextStyle(fontWeight: FontWeight.bold)), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(userName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _changeName,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    minimumSize: const Size(40, 40),
                  ),
                  child: const Icon(Icons.edit, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openSettings,
              child: const Text('Настройки'),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          onTap: (i) {
            switch (i) {
              case 0:
                context.go('/hotels');
                break;
              case 1:
                context.go('/history');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'История'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
        )

    );
  }
}

