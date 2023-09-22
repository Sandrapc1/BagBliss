// ignore_for_file: library_prefixes, use_key_in_widget_constructors
import 'package:bag_bliss/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart'
    as OrderTrackerZenPackage;

class OrderTrack extends StatelessWidget {
  const OrderTrack({Key? key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    List<OrderTrackerZenPackage.TrackerData> trackerData = [
      OrderTrackerZenPackage.TrackerData(
        title: "Order Place",
        date: "Sat, 8 Apr '22",
        tracker_details: [
          OrderTrackerZenPackage.TrackerDetails(
            title: "Your order was placed on Zenzzen",
            datetime: "Sat, 8 Apr '22 - 17:17",
          ),
          OrderTrackerZenPackage.TrackerDetails(
            title: "Zenzzen Arranged A Callback Request",
            datetime: "Sat, 8 Apr '22 - 17:42",
          ),
        ],
      ),
      OrderTrackerZenPackage.TrackerData(
        title: "Order Shipped",
        date: "Sat, 8 Apr '22",
        tracker_details: [
          OrderTrackerZenPackage.TrackerDetails(
            title: "Your order was shipped with MailDeli",
            datetime: "Sat, 8 Apr '22 - 17:50",
          ),
        ],
      ),
      OrderTrackerZenPackage.TrackerData(
        title: "Order Delivered",
        date: "Sat, 8 Apr '22",
        tracker_details: [
          OrderTrackerZenPackage.TrackerDetails(
            title: "You received your order, by MailDeli",
            datetime: "Sat, 8 Apr '22 - 17:51",
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title: const Text(
          'Order Track',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: height * 0.02, top: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Id : #0000154989',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(height: height * 0.01),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Messenger Bag'),
                      const Text('Qty: 1'),
                      const Text(
                        '₹ 5000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(height: height * 0.01),
                      const Text(
                        'Address : ponnumkunnu, \nhouse thrissur, \n654654\nkerala\n86566323232',
                        style: TextStyle(color: boxcolorstock),
                      )
                    ],
                  ),
                  Container(
                    height: height * 0.13,
                    width: width * 0.22,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/MessengerBag.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(height: height * 0.02),
              OrderTrackerZenPackage.OrderTrackerZen(tracker_data: trackerData),
              // SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
