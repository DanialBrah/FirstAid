import 'package:flutter/material.dart';
import 'criticalemergency.dart'; // Add this import at the top

class SymptomCheckerPage extends StatelessWidget {
  const SymptomCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.notifications, size: 28, color: Colors.white),
            onPressed: () {
              // Handle notification action
            },
          ),
          title: const Image(
            image: AssetImage('assets/images/rash.png'),
            height: 40,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle, size: 28, color: Colors.white),
              onPressed: () {
                // Handle profile action
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSymptomCard(
              context,
              'Headache',
              'A common symptom that can be caused by many factors such as stress, dehydration, or other illnesses.',
              'Common',
              0.7,
              'assets/images/symptom_image.png',
            ),
            const SizedBox(height: 16),
            _buildSymptomCard(
              context,
              'Fever',
              'A rise in body temperature, usually a sign of infection or illness.',
              'Rare',
              0.4,
              'assets/images/fever_image.png',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 26),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 26),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle, size: 26),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sick, size: 26),
            label: 'Symptom',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error, size: 26),
            label: 'Alert',
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          // Handle icon tap action
          if (index == 0) {
            // Navigate to Home (replace with your home page)
          } else if (index == 1) {
            // Navigate to Map (replace with your map page)
          } else if (index == 2) {
            // Navigate to Play (replace with your play page)
          } else if (index == 3) {
            // Stay on the current Symptom Checker page
          } else if (index == 4) {
            // Navigate to Critical Emergency page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CriticalEmergencyPage()),
            );
          }
        },
      ),
    );
  }
  Widget _buildSymptomCard(BuildContext context, String name, String description, String rarity, double rarityValue, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Symptom: $name',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Text(
                        'Rarity: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: rarityValue, // Progress bar to represent rarity
                          color: Colors.green,
                          backgroundColor: Colors.grey[300],
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        rarity,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Image(
              image: AssetImage(imagePath),
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
