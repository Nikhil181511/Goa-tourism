import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tourism/Question.dart';

class DudPage extends StatefulWidget {
  const DudPage({super.key});

  @override
  _DudPageState createState() => _DudPageState();
}

class _DudPageState extends State<DudPage> {
  final PageController _pageController = PageController();



  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage > 2) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Page'),
        backgroundColor: Colors.lightBlue[100],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset('assets/dudu.jpg', fit: BoxFit.cover),
                  Image.asset('assets/dudu2.jpg', fit: BoxFit.cover),
                  Image.asset('assets/dudu3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To Details',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Dudhsagar Waterfalls, one of India’s tallest and most spectacular waterfalls, is a must-visit natural wonder located on the border of Goa and Karnataka. Cascading from a height of over 300 meters (984 feet), the waterfall is aptly named “Dudhsagar,” meaning "Sea of Milk," due to its milky white appearance as water gushes down the rocky terrain.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Nestled within the lush greenery of the Western Ghats, Dudhsagar offers visitors a breathtaking sight, especially during the monsoon season when the falls are at their most powerful and the surrounding forest is lush and vibrant.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The combination of roaring waters, misty air, and dense jungle creates a magical atmosphere, making it a paradise for nature lovers, photographers, and adventure seekers alike.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Getting to Dudhsagar is an adventure in itself, as visitors can take a scenic train ride or opt for an exhilarating jeep safari through the Bhagwan Mahavir Wildlife Sanctuary, where they may encounter exotic wildlife along the way. For trekking enthusiasts, there are trails that lead to the base of the falls, offering stunning views of the landscape.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ' Visitors can also take a dip in the refreshing pool at the bottom of the falls, adding a touch of thrill to the experience. Easily accessible from popular Goan destinations like Panaji and Margao, Dudhsagar Waterfalls is a day-trip destination that provides an escape into the heart of nature, leaving visitors mesmerized by its sheer beauty and raw power. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ' For those looking to add an element of adventure and natural wonder to their Goan vacation, Dudhsagar is an unforgettable experience.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                        const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {  },
                    child: const Text('Book a Tour'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DhudhsagarApp()),
                      );                    },
                    style: ButtonStyle(
                        backgroundColor:
                        const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                        const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    child: const Text('Play Quiz!'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}