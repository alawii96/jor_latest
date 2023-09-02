//ignore everything
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomerRecoveryService extends StatefulWidget {
  const CustomerRecoveryService({super.key});

  @override
  State<CustomerRecoveryService> createState() =>
      _CustomerRecoveryServiceState();
}

class _CustomerRecoveryServiceState extends State<CustomerRecoveryService> {
  double currentSize = 175;
  bool expanded = false;
  bool error = false;
  String results = "";

  changeSize() {
    if (currentSize == 175) {
      currentSize = 350;
    } else if (currentSize == 350) {
      currentSize = 175;
    }

    setState(() {});
  }

  executeLambda() async {
    http.Response resp = await http.get(Uri.parse(
        'https://wcyb3pc52qt7pnqegwoujfxise0zkcuv.lambda-url.eu-west-1.on.aws'));

    if (resp.statusCode != 200) {
      error = true;
    } else {
      error = false;
    }
    results = resp.body;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _cifController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    return InkWell(
      onTap: () => changeSize(),
      child: AnimatedContainer(
        onEnd: () {
          if (currentSize == 175) {
            expanded = false;
          } else {
            expanded = true;
          }

          setState(() {});
        },
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        height: currentSize,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black54,
            border: Border.all(color: Colors.green)),
        duration: const Duration(milliseconds: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recovery",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                //Heading and title
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  color: Colors.green.withOpacity(0.5),
                  child: Text(
                    "Stable",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            //Description
            SizedBox(
              height: 15,
            ),
            Text(
              "This task would allow you to send  a recovery code to a customer",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(
              height: 15,
            ),
            expanded
                ? Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.green)),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 10),
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.numbers,
                                    color: Colors.green,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.green)),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 10),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.email,
                                      color: Colors.green,
                                    ),
                                  ),
                                  hintStyle: TextStyle(color: Colors.green)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => executeLambda(),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.green)),
                              child: Text(
                                "SEND",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.green,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          results,
                          style: TextStyle(
                              color: error ? Colors.red : Colors.green),
                        ),
                      ),
                    ],
                  )
                : Container(),
            Spacer(),
            Center(
                child: Icon(
              currentSize == 175
                  ? Icons.arrow_drop_down_rounded
                  : Icons.arrow_drop_up_rounded,
              color: Colors.green,
            ))
          ],
        ),
      ),
    );
  }
}
