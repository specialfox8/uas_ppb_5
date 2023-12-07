import 'package:uas_ppb_5/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

import 'package:uas_ppb_5/screens/historyscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String getGreeting() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Selamat pagi!';
    } else if (hour < 18) {
      return 'Selamat siang!';
    } else {
      return 'Selamat malam!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getGreeting(),
              style: const TextStyle(fontSize: 24),
            ),
            Text('${user?.email}'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
                border: Border.all(
                  color: Colors.white, // Warna border
                  width: 2.0, // Lebar border
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  //target screen
                },
              ),
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(167, 211, 151, 1.000),
        toolbarHeight: MediaQuery.of(context).size.height *
            0.1, // Sesuaikan proporsi yang diinginkan
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.cyan,
              ),
              child: Text('${user?.email}'),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      const Card(
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 2.5,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                          ),
                                          // child: Image.asset(
                                          //   'assets/images/1.jpg',
                                          //   fit: BoxFit.cover,
                                          //   height: double.infinity,
                                          //   width: double.infinity,
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),
                      //image slider
                      const SliderImage(),
                      // CarouselSlider(
                      //   options: CarouselOptions(
                      //     height: 200,
                      //     enlargeCenterPage: true,
                      //     autoPlay: true,
                      //     aspectRatio: 16 / 9,
                      //     autoPlayCurve: Curves.fastOutSlowIn,
                      //     enableInfiniteScroll: true,
                      //     autoPlayAnimationDuration:
                      //         const Duration(milliseconds: 500),
                      //     viewportFraction: 0.8,
                      //   ),
                      //   items: [1, 2, 3, 4, 5].map((i) {
                      //     return Builder(
                      //       builder: (BuildContext context) {
                      //         return Container(
                      //           margin:
                      //               const EdgeInsets.symmetric(horizontal: 5),
                      //           decoration:
                      //               const BoxDecoration(color: Colors.white),
                      //               child: Center(),
                      //           // child: Stack(
                      //           //   alignment: Alignment.center,
                      //           //   children: [
                      //           //     Image.asset('assets/images/1.jpg',
                      //           //         fit: BoxFit.cover),
                      //           //     Image.asset('assets/images/2.jpg',
                      //           //         fit: BoxFit.cover),
                      //           //     // menambahkan teks
                      //           //     // Text(
                      //           //     //   'Text $i',
                      //           //     //   style: TextStyle(
                      //           //     //       fontSize: 16.0, color: Colors.white),
                      //           //     // ),
                      //           //   ],
                      //           // ),
                      //         );
                      //       },
                      //     );
                      //   }).toList(),
                      // ),

                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Card(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white, // Warna border
                                      width: 2.0, // Lebar border
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.shopping_cart),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HistoryScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: 20,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Text('Pick Up'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: 20,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: Text('Menu'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      //image slider

                      const Text('Customer Service'),
                      const SizedBox(height: 16),
                      const Text('wadawdawdwad'),
                    ],
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

class SliderImage extends StatefulWidget {
  const SliderImage({Key? key}) : super(key: key);

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  Timer? _timer;
  final List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    // Add more images as needed
  ];

  @override
  void initState() {
    super.initState();
    _startSliderTimer();
  }

  void _startSliderTimer() {
    const Duration duration = Duration(seconds: 3); // Ganti sesuai kebutuhan
    _timer = Timer.periodic(duration, (timer) {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _controller.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.0,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
            itemCount: images.length,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length, // Change this to the number of images you have
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: .0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
