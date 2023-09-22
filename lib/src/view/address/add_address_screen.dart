import 'package:bag_bliss/core/colors.dart';
import 'package:bag_bliss/src/controller/addres_controller.dart';
import 'package:bag_bliss/src/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddScreen extends StatelessWidget {
  AddressAddScreen({super.key, });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddressController addressController = Get.put(AddressController());
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        iconTheme: const IconThemeData(color: white),
        title: const Text(
          ' Add Delivery Address',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
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
                  controller: namecontroler,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: pincodecontroler,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: const InputDecoration(labelText: 'Pincode'),
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
                  controller: addrescontroler,
                  decoration: const InputDecoration(labelText: 'House name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your house name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: citycontroler,
                  decoration: const InputDecoration(labelText: 'City'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: statecontroller,
                  decoration: const InputDecoration(labelText: 'State'),
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
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length != 10) {
                      return 'Phone number must be 10 digits long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                // Row(
                //   children: [
                //     Radio(
                //       value: 'Home', 
                //       groupValue: , 
                //       onChanged: (value) {
                        
                //       },)
                //   ],
                // ),
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
                              id: '',
                            );
                            addressController.addAddress(addresss);
                            Get.back();
                          } catch (e) {
                            // print('Error parsing phone or pincode: $e');
                          }
                        } 
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SAVE',
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



// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bag_bliss/core/colors.dart';
// import 'package:bag_bliss/src/controller/addres_controller.dart';
// import 'package:bag_bliss/src/model/address_model.dart';

// class AddressAddScreen extends StatefulWidget {
//   const AddressAddScreen({Key? key}) : super(key: key);

//   @override
//   _AddressAddScreenState createState() => _AddressAddScreenState();
// }

// class _AddressAddScreenState extends State<AddressAddScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final AddressController addressController = Get.put(AddressController());
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController addresscontroller = TextEditingController();
//   final TextEditingController pincodeController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController stateController = TextEditingController();
//   String? selectedAddressType;

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appbar,
//         iconTheme: const IconThemeData(color: white),
//         title: const Text(
//           'Add Delivery Address',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: nameController,
//                   decoration: const InputDecoration(labelText: 'Name'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: pincodeController,
//                   keyboardType: TextInputType.number,
//                   maxLength: 6,
//                   decoration: const InputDecoration(labelText: 'Pincode'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter a pincode';
//                     } else if (value.length != 6) {
//                       return 'Pincode must be 6 digits long';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: addresscontroller,
//                   decoration: const InputDecoration(labelText: 'House name'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your house name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: cityController,
//                   decoration: const InputDecoration(labelText: 'City'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your city';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: stateController,
//                   decoration: const InputDecoration(labelText: 'State'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your state';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: phoneController,
//                   keyboardType: TextInputType.number,
//                   maxLength: 10,
//                   decoration: const InputDecoration(labelText: 'Phone Number'),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your phone number';
//                     } else if (value.length != 10) {
//                       return 'Phone number must be 10 digits long';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10),

//                 // Radio buttons for selecting address type
//                 const Text('Select Address Type:'),
//                 Row(
//                   children: [
//                     Radio(
//                       value: 'Home',
//                       groupValue: selectedAddressType,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedAddressType = value.toString();
//                         });
//                       },
//                     ),
//                     const Text('Home'),
//                     Radio(
//                       value: 'Office',
//                       groupValue: selectedAddressType,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedAddressType = value.toString();
//                         });
//                       },
//                     ),
//                     const Text('Office'),
//                     Radio(
//                       value: 'Apartment',
//                       groupValue: selectedAddressType,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedAddressType = value.toString();
//                         });
//                       },
//                     ),
//                     const Text('Apartment'),
//                   ],
//                 ),

//                 SizedBox(height: height * 0.1),
//                 Padding(
//                   padding: EdgeInsets.only(left: width * 0.1),
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: height * 0.07,
//                     width: width * 0.7,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(7),
//                       color: appbar,
//                       border: Border.all(color: white, width: 2),
//                     ),
//                     child: InkWell(
//                       onTap: () {
//                         // Validate the form before saving
//                         if (_formKey.currentState!.validate()) {
//                           try {
//                             var addresss = AddressModel(
//                               name: nameController.text,
//                               address: addresscontroller.text,
//                               phone: phoneController.text,
//                               city: cityController.text,
//                               state: stateController.text,
//                               pincode: pincodeController.text,
//                               id: '',
//                               addressType: selectedAddressType,
//                             );
//                             addressController.addAddress(addresss);
//                             Get.back();
//                           } catch (e) {
//                             // Handle errors
//                           }
//                         }
//                       },
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'SAVE',
//                             style: TextStyle(color: white, fontSize: 19),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

