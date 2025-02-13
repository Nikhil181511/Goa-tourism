import 'package:flutter/material.dart';
import 'package:tourism/Question.dart';
import 'dart:async';

class PaloPage extends StatefulWidget {
  @override
  _PaloPageState createState() => _PaloPageState();
}

class _PaloPageState extends State<PaloPage> {
  PageController _pageController = PageController();



  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage > 2) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page'),
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
                  Image.asset('assets/pal.jpg', fit: BoxFit.cover),
                  Image.asset('assets/palo.jpg', fit: BoxFit.cover),
                  Image.asset('assets/palolo.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
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
                          'Palolem Beach, located in the southern part of Goa in the Canacona region, is one of the most scenic and serene beaches in the area. Its unique semi-circular shape and lush palm trees create a perfect tropical setting. The waters here are shallow and calm, making it an ideal spot for swimming and a relaxed beach experience.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The beach attracts a diverse crowd, from families and couples to backpackers, all looking for a laid-back atmosphere. While it doesn’t have the intense party scene of North Goa beaches like Anjuna or Baga, Palolem has a vibrant, low-key nightlife with beach shacks and small bars hosting live music. Visitors can also enjoy water activities such as kayaking, paddle boating, and boat tours to nearby places like Butterfly Beach and Cabo De Rama Fort, which offers panoramic views of the Arabian Sea.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Accommodations around Palolem are varied, ranging from budget guesthouses and cottages to mid-range hotels, with many places offering beachfront stays. The best time to visit is between November and February, when the weather is pleasant and ideal for enjoying the beach. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The area is known for its relaxed vibe, and while it does attract tourists, it still maintains a quiet charm compared to more crowded parts of Goa. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The local cuisine features a mix of Goan seafood and international dishes. Palolem is easily accessible by air, train, or road, with the nearest airport being Dabolim, about 63 km away. ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          ' The beach is also part of efforts to maintain environmental consciousness, with locals and visitors working to preserve its natural beauty. Whether you\'re looking to unwind or explore, Palolem provides a peaceful escape with plenty of activities to enjoy',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Book a Tour'),
                    style: ButtonStyle(
                        backgroundColor:
                        const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                        const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))), onPressed: () {  },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DhudhsagarApp()),
                      );
                      // Handle the quiz button press
                    },
                    child: Text('Play Quiz!'),
                    style: ButtonStyle(
                        backgroundColor:
                        const WidgetStatePropertyAll(Colors.black),
                        foregroundColor:
                        const WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
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