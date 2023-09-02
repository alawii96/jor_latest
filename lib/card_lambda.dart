import 'package:flutter/material.dart';

class LambdaPage extends StatefulWidget {
  const LambdaPage({super.key});

  @override
  State<LambdaPage> createState() => _LambdaPageState();
}

class _LambdaPageState extends State<LambdaPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: [
              Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
