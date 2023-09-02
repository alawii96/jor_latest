import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetJumio extends StatefulWidget {
  const GetJumio({super.key});

  @override
  State<GetJumio> createState() => _GetJumioState();
}

class _GetJumioState extends State<GetJumio> {
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
            border: Border.all(color: Colors.blue)),
        duration: const Duration(milliseconds: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Get Jumio Reference",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),

                //Heading and title
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  color: Colors.blue.withOpacity(0.5),
                  child: Text(
                    "Under development",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            //Description
            SizedBox(
              height: 15,
            ),
            Text(
              "This would allow you to create an account for the customer with JOR as a currency",
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
                                border: Border.all(color: Colors.blue)),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: "Customer ID",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 10),
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.numbers,
                                    color: Colors.blue,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            //onTap: () => executeLambda(),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: Text(
                                "SEND",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.blue,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          results,
                          style: TextStyle(
                              color: error ? Colors.red : Colors.blue),
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
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
