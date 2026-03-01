import 'package:flutter/material.dart';

class CryptoTask extends StatelessWidget {
  const CryptoTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF202020),
        body: Center(
          child: Container(
            width: 350,
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Color(0xFF0E0E0E),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        "https://images.unsplash.com/photo-1621761191319-c6fb62004040?q=80&w=1000",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      Positioned(
                        top: 20,
                        left: 20,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.black.withAlpha(95),

                            child: Text(
                              "VIP MEMBER",
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "Total Crypto Balance",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Icon(Icons.account_balance_wallet, color: Colors.blue),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 15),
                    Text(
                      "0.456 BTC",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    spacing: 10,

                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),

                          child: Center(
                            child: Text(
                              "Send",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: BoxBorder.all(color: Colors.blue),
                          ),
                          child: Center(
                            child: Text(
                              "Receive",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
