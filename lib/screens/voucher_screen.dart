import 'package:flutter/material.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    Widget cashbackPromotion() {
      return Card(
        color: const Color.fromARGB(255, 214, 234, 207),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
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
                      'VOUCHER CASHBACK 10%',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'BebasNeue',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'T&C',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Until 15/12/2023',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(143, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 315,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  children: [
                    Text(
                      'USE',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget mojitoPromotion() {
      return Card(
        color: const Color.fromARGB(255, 214, 234, 207),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
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
                      'B1G1 MOJITO LIME',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'BebasNeue',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'T&C',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Until 25/12/2023',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(143, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 315,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  children: [
                    Text(
                      'USE',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget winterPromotion() {
      return Card(
        color: const Color.fromARGB(255, 214, 234, 207),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
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
                      'CHRISMAST DISC. 30%',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'BebasNeue',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'T&C',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Until 25/12/2023',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(143, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 315,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  children: [
                    Text(
                      'USE',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget gopayPromotion() {
      return Card(
        color: const Color.fromARGB(255, 214, 234, 207),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
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
                      'GOPAY CASHBACK 5K',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'BebasNeue',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'T&C',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Until 28/12/2023',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(143, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 315,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  children: [
                    Text(
                      'USE',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget desemberPromotion() {
      return Card(
        color: const Color.fromARGB(255, 214, 234, 207),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 7,
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
                      'ALL COFFEE JUST 20K',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'BebasNeue',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'T&C',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Until 31/12/2023',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromARGB(143, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 65,
              left: 315,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  children: [
                    Text(
                      'USE',
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
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
                    'MY VOUCHER',
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Redeem Code',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.qr_code_scanner_rounded),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              cashbackPromotion(),
              const SizedBox(
                height: 5,
              ),
              mojitoPromotion(),
              const SizedBox(
                height: 5,
              ),
              winterPromotion(),
              const SizedBox(
                height: 5,
              ),
              gopayPromotion(),
              const SizedBox(
                height: 5,
              ),
              desemberPromotion(),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
