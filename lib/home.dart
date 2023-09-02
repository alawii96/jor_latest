// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_app/card_services/create_afs_account.dart';
import 'package:test_app/card_services/create_jor_account.dart';
import 'package:test_app/card_services/create_virtual_card.dart';
import 'package:test_app/card_services/update_afs_account.dart';
import 'package:test_app/customer_services/details.dart';
import 'package:test_app/others/get_jumio_ref.dart';
import 'package:test_app/others/identification.dart';
import 'customer_services/archival.dart';
import 'customer_services/recovery.dart';
import 'others/manual_onboarding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> customerServices = [
    CustomerRecoveryService(),
    CustomerArchivalService(),
    CustomerDetailsService(),
  ];
  List<Widget> cardServices = [
    CreateJORAccount(),
    UpdateAFSAccount(),
    CreateAFSAccount(),
    CreateVirtualCard(),
  ];

  List<Widget> otherServices = [
    CreateIdentificationCase(),
    ManualOnboarding(),
    GetJumio()
  ];

  int selectedIndex = 0;

  changeIndex(int num) {
    setState(() {
      selectedIndex = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Row(
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                FlutterLogo(
                  size: 200,
                ),
                Divider(),
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  onTap: () => changeIndex(0),
                  leading: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 40,
                  ),
                  title: Text(
                    "Customers",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () => changeIndex(1),
                  leading: Icon(
                    Icons.card_membership,
                    color: Colors.green,
                    size: 40,
                  ),
                  title: Text(
                    "Accounts and cards",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: () => changeIndex(2),
                  leading: Icon(
                    Icons.report,
                    color: Colors.green,
                    size: 40,
                  ),
                  title: Text(
                    "Others",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Row(
              children: selectedIndex == 0
                  ? customerServices.map((e) => e).toList()
                  : selectedIndex == 1
                      ? cardServices.map((e) => e).toList()
                      : otherServices.map((e) => e).toList()),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Center(
          child: Text(
            "Made by Ali AlQattan, and reviewed and approved by jaafar alaali",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
