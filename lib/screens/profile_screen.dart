import 'package:flutter/material.dart';
import 'package:uas_ppb_5/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;

    Widget profile() {
      return Card(
        color: const Color.fromARGB(255, 214, 234, 207),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ACCOUNT',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'BebasNeue',
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.person_2),
                        Text(
                          ' Profile Information',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BebasNeue',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.favorite_outlined),
                        Text(
                          ' Wishlist',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BebasNeue',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.payments_outlined),
                        Text(
                          ' Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BebasNeue',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget about() {
      return Card(
        color: const Color.fromARGB(255, 214, 234, 207),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'BebasNeue',
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.settings_rounded),
                        Text(
                          ' Settings',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BebasNeue',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call_rounded),
                        Text(
                          ' Help Center',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BebasNeue',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_sharp),
                        Text(
                          ' Privacy Police',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'BebasNeue',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: const Color.fromRGBO(167, 211, 151, 1.000),
        title: Container(
          padding: const EdgeInsets.all(8.0),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'MY PROFILE',
                    style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 214, 234, 207),
                    child: Text(
                      '${user?.email}'[0].toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: 60,
                        color: Colors.black,
                      ),
                    ),
                    radius: 60,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '${user?.email}',
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              Text(
                '0987-09873-8403',
                style: TextStyle(
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color.fromARGB(143, 0, 0, 0),
                ),
              ),
              SizedBox(height: 10),
              profile(),
              SizedBox(height: 10),
              about(),
              SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 214, 234, 207),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).logout();
                },
                child: Text(
                  'LOGOUT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
