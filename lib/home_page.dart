import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_blue/quick_blue.dart';
// import 'package:thermal_printer/thermal_printer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var printerManager = PrinterManager.instance;

  // var devices = [];

  // void scan(PrinterType type, {bool isBle = false}) async {
  //   // Find printers
  //   PrinterManager.instance
  //       .discovery(type: type, isBle: isBle)
  //       .listen((device) {
  //     log('----listen 1');
  //     log('-----${device.address} || ${device.name} || ${device.productId}');
  //     devices.add(device);
  //   });
  // }

  // @override
  // void initState() {
  //   scan(PrinterType.bluetooth);
  //   super.initState();
  // }

  List<BlueScanResult> dataBlue = [];
  void scanBlue() async {
    log('scannn');
    QuickBlue.scanResultStream.listen((result) {
      print('onScanResult $result');
      dataBlue.add(result);
      setState(() {});
    });

    QuickBlue.startScan();
// ...
    // QuickBlue.stopScan();
  }

  void stopScan() {
    QuickBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  scanBlue();
                },
                child: Text('Scan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  stopScan();
                },
                child: Text('Stop Scan'),
              ),
              SizedBox(height: 40),
              ...dataBlue.map(
                (e) => Text('${e.name} || ${e.deviceId} || ${e.rssi}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
