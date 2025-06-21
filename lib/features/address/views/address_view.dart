import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Address'), centerTitle: true),
        body: ListView.builder(
          itemCount: 10, // Example item count
          itemBuilder: (context, index) {
            return AddressItem(
              address: 'Address $index',
              streat: 'Street $index',
              city: 'City $index',
              country: 'Country $index',
            );
          },
        ),
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.address,
    required this.streat,
    required this.city,
    required this.country,
  });
  final String address;
  final String streat;
  final String city;
  final String country;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.grey, width: 0.5),
        ),
        leading: const Icon(Icons.location_on),
        title: Text(address),
        subtitle: Text(' $streat , $city, $country'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            // Handle edit action
          },
        ),
      ),
    );
  }
}
