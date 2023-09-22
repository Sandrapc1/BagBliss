// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/addres_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/address_model.dart';

class AddressUpdate extends StatelessWidget {
   AddressUpdate({super.key,required this.addressData,required this.addressId});
 final addressId;
  final addressData;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddressController addressController=Get.put(AddressController());
  final TextEditingController namecontroler = TextEditingController();
  final TextEditingController addrescontroler = TextEditingController();
  final TextEditingController pincodecontroler = TextEditingController();
  final TextEditingController phonecontroler = TextEditingController();
  final TextEditingController citycontroler = TextEditingController();
  final TextEditingController statecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    namecontroler.text = addressData['name'];
    addrescontroler.text = addressData['address'];
    pincodecontroler.text = addressData['pincode'];
    phonecontroler.text = addressData['phone'];
    citycontroler.text = addressData['city'];
    statecontroller.text = addressData['state'];
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title: const Text(
          ' Edit Address',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Name'),
                  controller: namecontroler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: const InputDecoration(hintText: 'Pincode'),
                  controller: pincodecontroler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a pincode';
                    } else if (value.length != 6) {
                      return 'Pincode must be 6 digits long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'House name'),
                  controller: addrescontroler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your house name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'City'),
                  controller: citycontroler,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'State'),
                  controller: statecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phonecontroler,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(hintText: 'Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length != 10) {
                      return 'Phone number must be 10 digits long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.1),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.1),
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 0.07,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: appbar,
                      border: Border.all(color: white, width: 2),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Validate the form before saving
                        if (_formKey.currentState!.validate()) {
                          try {
                            var addresss = AddressModel(
                              name: namecontroler.text,
                              address: addrescontroler.text,
                              phone: phonecontroler.text,
                              city: citycontroler.text,
                              state: statecontroller.text,
                              pincode: pincodecontroler.text,
                               id: addressId,
                            );
                            addressController.editAddress(addresss,addressId);
                            Get.back();
                          } catch (e) {
                            // print('Error parsing phone or pincode: $e');
                          }
                        }
                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.refresh_outlined,color: white,),
                          SizedBox(width: width*0.01),
                          const Text(
                            'Update',
                            style: TextStyle(color: white, fontSize: 19),
                          ),
                        ],
                      ),
                    ),
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
