import 'package:uas_ppb_5/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              style: TextStyle(fontSize: 24),
            ),
            Container(
              child: Text('${user?.email}'),
            ),
            // Text(
            //   'Peter N',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
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
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  //target screen
                },
              ),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 8, 206, 74),
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
              title: const Text('home'),
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
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: double.infinity,
                          height: 80,
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
                          child: const Column(children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "bagian point",
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),

                      const SizedBox(height: 16),
                      //image slider
                      CarouselSlider(
                        options: CarouselOptions(height: 200),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(color: Colors.white),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset('assets/images/1.jpg',
                                        fit: BoxFit.cover),
                                    Image.asset('assets/images/2.jpg',
                                        fit: BoxFit.cover),
                                    // menambahkan teks
                                    // Text(
                                    //   'Text $i',
                                    //   style: TextStyle(
                                    //       fontSize: 16.0, color: Colors.white),
                                    // ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 16),
                      Row(
                        children: [
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
