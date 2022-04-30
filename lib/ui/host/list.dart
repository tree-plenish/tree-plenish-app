import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tree_plenish_app/models/host_state.dart';
import 'package:http/http.dart' as http;

Future<List<OrderData>> fetchOrderData(schoolid) async {
  final response = await http.get(
      Uri.parse('http://127.0.0.1:5000/data?name=deliverorders&schoolid=$schoolid'));

  if (response.statusCode == 200) {
    Map jsonResponse = json.decode(response.body);
    List<OrderData> data = [];
    jsonResponse.forEach((k, v) {
      data.add(OrderData.fromJson(v));
    });
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

class OrderData {
  final String email;
  final String name;
  final String phone;
  final String address;

  const OrderData({
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      address: json['address']
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<OrderData>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchOrderData(Provider.of<HostStateModel>(context, listen: false).schoolid);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HostStateModel>(
      builder: (context, data, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Order Addresses'),
        ),
        body: FutureBuilder<List<OrderData>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<OrderData> data = snapshot.data ?? <OrderData>[];
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                      title: Text(data[index].address),
                      children: [
                        Text(data[index].name),
                        Text(data[index].email),
                        Text(data[index].phone),
                      ],
                    );
                  });
              
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
