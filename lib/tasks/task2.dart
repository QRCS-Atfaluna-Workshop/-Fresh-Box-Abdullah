import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 350,
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                        "https://assets.hrewards.com/assets/jpg.xxlarge_SHR_Hamburg_restaurant_Stadthaus_8_0d111ed2f6.jpg?optimize",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      Positioned(
                        top: 20,
                        right: 10,
                        child: Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.favorite, color: Colors.red),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 20,
                        bottom: 30,
                        child: Container(
                          alignment: AlignmentGeometry.center,
                          width: 60,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Text(
                            "New",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  "golden LEGO cube",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,

                    "This is the text This is the text This is the text This is the text This is the text This is the text  text This is the texttext ",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  spacing: 15,
                  children: [
                    Text(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      "\$120.00 ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Expanded(
                      child: Container(
                        alignment: AlignmentGeometry.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Buy Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// }
//    child: Row(
//                     spacing: 10,

//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(5),
//                           ),

//                           child: Center(
//                             child: Text(
//                               "Send",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           height: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             border: BoxBorder.all(color: Colors.blue),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Receive",
//                               style: TextStyle(color: Colors.blue),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
