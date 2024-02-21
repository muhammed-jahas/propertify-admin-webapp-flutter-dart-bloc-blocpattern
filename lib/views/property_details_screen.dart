import 'package:flutter/material.dart';
import 'package:propertify_webapp/constants/app_fonts.dart';
import 'package:propertify_webapp/constants/icons.dart';
import 'package:propertify_webapp/constants/paddings.dart';
import 'package:propertify_webapp/constants/spaces.dart';
import 'package:propertify_webapp/resources/colors/app_colors.dart';
import 'package:propertify_webapp/resources/components/custom_buttons.dart';
import 'package:propertify_webapp/resources/components/custom_iconbox.dart';
import 'package:propertify_webapp/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/property_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// class PropertyDetailsScreen extends StatefulWidget {
//   final PropertyModel property;
//   const PropertyDetailsScreen({super.key, required this.property});

//   @override
//   State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
// }

// class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
//   String? userId;

//   @override
//   void initState() {
//     super.initState();
//     getUserIdFromSharedPrefs();
//   }

//   void getUserIdFromSharedPrefs() async {
//     // final sharedPref = SharedPref.instance;
//     // userId = await sharedPref.getUserId();
//     // if (userId != null) {
//     //   // You have the userId, you can use it here
//     //   print('User ID: $userId');
//     // }
//     // // Handle the case where userId is null if needed
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Future<UserModel> user = getUserData();

//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         Container(
//                           width: double.maxFinite,
//                           height: MediaQuery.of(context).size.height * .3,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(40),
//                               bottomRight: Radius.circular(40),
//                             ),
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: NetworkImage(
//                                   '${property.propertyCoverPicture!.path}'),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: double.maxFinite,
//                           height: MediaQuery.of(context).size.height * .3,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [
//                                 Colors.black.withOpacity(0.7),
//                                 Colors.transparent,
//                               ],
//                               begin: Alignment.topCenter,
//                               end: Alignment.center,
//                               stops: [0.0, 1.0],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           left: 20,
//                           top: 40,
//                           child: CustomIconBox(
//                             boxheight: 40,
//                             boxwidth: 40,
//                             boxIcon: Icons.arrow_back,
//                             radius: 8,
//                             boxColor: Colors.transparent,
//                             iconSize: 24,
//                             IconColor: Colors.white,
//                             iconFunction: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ),
//                         Positioned(
//                           right: 20,
//                           top: 40,
//                           child: Row(
//                             children: [
//                               CustomIconBox(
//                                 boxheight: 40,
//                                 boxwidth: 40,
//                                 boxIcon: Icons.bookmark_border,
//                                 radius: 8,
//                                 boxColor: Colors.transparent,
//                                 iconSize: 24,
//                                 IconColor: Colors.white,
//                                 iconFunction: () async {
//                                   await _addToFavourites();
//                                 },
//                               ),
//                               // CustomIconBox(
//                               //   boxheight: 40,
//                               //   boxwidth: 40,
//                               //   boxIcon: Icons.share_outlined,
//                               //   radius: 8,
//                               //   boxColor: Colors.transparent,
//                               //   iconSize: 24,
//                               //   IconColor: Colors.white,
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     customSpaces.verticalspace20,
//                     Padding(
//                       padding: customPaddings.horizontalpadding20,
//                       child: GridView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         padding: EdgeInsets.all(0),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 4,
//                           mainAxisSpacing: 10,
//                           crossAxisSpacing: 10,
//                           childAspectRatio: 1 / 1,
//                         ),
//                         itemBuilder: (context, index) {
//                           if (index <
//                               property.propertyGalleryPictures!.length) {
//                             // Check if the index is within the bounds of the list
//                             return ClipRRect(
//                               borderRadius: BorderRadius.circular(4),
//                               child: Image(
//                                 height: 140,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(
//                                     '${property.propertyGalleryPictures![index].path}'),
//                               ),
//                             );
//                           } else {
//                             // If index is out of bounds, you can display a placeholder or empty container
//                             return Container(); // Empty container
//                           }
//                         },
//                         itemCount:
//                             property.propertyGalleryPictures!.length,
//                         shrinkWrap: true,
//                       ),
//                     ),
//                     customSpaces.verticalspace20,

//                     Padding(
//                       padding: customPaddings.horizontalpadding20,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 6),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.secondaryColor,
//                                     borderRadius: BorderRadius.circular(50)),
//                                 child: Text(
//                                   property.propertyCategory,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                               customSpaces.horizontalspace10,
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     PropertifyIcons.location,
//                                     color: Colors.grey,
//                                     size: 16,
//                                   ),
//                                   customSpaces.horizontalspace5,
//                                   Text(
//                                     property.propertyCity,
//                                     style: AppFonts.greyText14,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           customSpaces.verticalspace5,
//                           Text(
//                             property.propertyName,
//                             style: AppFonts.SecondaryColorText24,
//                           ),
//                         ],
//                       ),
//                     ),
//                     customSpaces.verticalspace10,
//                     Padding(
//                       padding: customPaddings.horizontalpadding20,
//                       child: Row(
//                         children: [
//                           IconwithText(
//                             contentIcon: PropertifyIcons.sqft,
//                             contentText: '1848 sqft',
//                           ),
//                           customSpaces.horizontalspace20,
//                           IconwithText(
//                             contentIcon: PropertifyIcons.bed,
//                             contentText: '3 Rooms',
//                           ),
//                           customSpaces.horizontalspace20,
//                           IconwithText(
//                             contentIcon: Icons.shower_outlined,
//                             contentText: '2 Bathrooms',
//                           ),
//                         ],
//                       ),
//                     ),
//                     customSpaces.verticalspace10,
//                     Divider(),
//                     customSpaces.verticalspace10,

//                     Padding(
//                       padding: customPaddings.horizontalpadding20,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               CircleAvatar(
//                                 child: Text(
//                                   // Add Text widget inside the CircleAvatar
//                                   property.agent!.name != null &&
//                                           widget
//                                               .property.agent!.name!.isNotEmpty
//                                       ? property.agent!.name![0]
//                                           .toUpperCase()
//                                       : 'D', // Use the first letter or 'D' for Default
//                                   style: AppFonts.WhiteColorText16,
//                                 ),
//                               ),
//                               customSpaces.horizontalspace20,
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   customSpaces.verticalspace5,
//                                   Text(
//                                     'Listing Agent',
//                                     style: AppFonts.SecondaryColorText10,
//                                   ),
//                                   Text(
//                                     property.agent!.name ?? 'Default',
//                                     style: AppFonts.SecondaryColorText24,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               CustomIconBox(
//                                 boxheight: 50,
//                                 boxwidth: 50,
//                                 boxIcon: Icons.call_outlined,
//                                 radius: 8,
//                                 boxColor: Colors.grey.shade200,
//                                 iconSize: 24,
//                                 IconColor: AppColors.secondaryColor,
//                                 iconFunction: () {
//                                   launchPhoneCall(
//                                       property.agent!.phone!);
//                                 },
//                               ),
//                               customSpaces.horizontalspace10,
//                               CustomIconBox(
//                                 boxheight: 50,
//                                 boxwidth: 50,
//                                 boxIcon: Icons.messenger_outline_rounded,
//                                 radius: 8,
//                                 boxColor: Colors.grey.shade200,
//                                 iconSize: 24,
//                                 IconColor: AppColors.secondaryColor,
//                                 iconFunction: () {
//                                   // Navigator.of(context).push(MaterialPageRoute(
//                                   //   builder: (context) => ComingSoon(),
//                                   // ));
//                                 },
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     customSpaces.verticalspace10,
//                     Divider(),
//                     customSpaces.verticalspace10,

//                     Padding(
//                       padding: customPaddings.horizontalpadding20,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Overview',
//                             style: AppFonts.SecondaryColorText20,
//                           ),
//                           customSpaces.verticalspace10,
//                           Text(
//                             property.propertyDescription!,
//                             textAlign: TextAlign.justify,
//                             style: AppFonts.greyText14,
//                           ),
//                         ],
//                       ),
//                     ),
//                     customSpaces.verticalspace20,

//                     Padding(
//                       padding: customPaddings.horizontalpadding20,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Location',
//                             style: AppFonts.SecondaryColorText20,
//                           ),
//                           customSpaces.verticalspace20,
//                           GestureDetector(
//                             onTap: () async {
//                               await _launchDirections(
//                                 double.parse(property.latitude ?? '0.0'),
//                                 double.parse(
//                                     property.longitude ?? '0.0'),
//                               );
//                             },
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Container(
//                                 height: 200,
//                                 child: GoogleMap(
//                                   padding: EdgeInsets.all(10),
//                                   initialCameraPosition: CameraPosition(
//                                     target: LatLng(
//                                       double.parse(
//                                           property.latitude ?? '0.0'),
//                                       double.parse(
//                                           property.longitude ?? '0.0'),
//                                     ),
//                                     zoom: 10,
//                                   ),
//                                   markers: <Marker>[
//                                     Marker(
//                                       markerId: MarkerId('property_location'),
//                                       position: LatLng(
//                                         double.parse(
//                                             property.latitude ?? '0.0'),
//                                         double.parse(
//                                             property.longitude ?? '0.0'),
//                                       ),
//                                       infoWindow: InfoWindow(
//                                         title: property.propertyName,
//                                       ),
//                                     ),
//                                   ].toSet(),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           customSpaces.verticalspace20,
//                           Text(
//                             'Features & Amentities',
//                             style: AppFonts.SecondaryColorText20,
//                           ),
//                           customSpaces.verticalspace20,
//                           ListView.builder(
//                             padding: EdgeInsets.all(0),
//                             physics: NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               final amenities = property.amenities;
//                               final amenity = amenities![index];

//                               Icon? amenityIcon = amenityIcons[amenity];

//                               return Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 10),
//                                 child: Container(
//                                   color: Colors.grey.shade200,
//                                   child: ListTile(
//                                     leading:
//                                         amenityIcon, // Use the icon as leading
//                                     title: Text(amenity),
//                                   ),
//                                 ),
//                               );
//                             },
//                             itemCount: property.amenities!.length,
//                           ),
//                           customSpaces.verticalspace20,
//                           Text(
//                             'Tags',
//                             style: AppFonts.SecondaryColorText20,
//                           ),
//                           customSpaces.verticalspace20,
//                           GridView.builder(
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 4,
//                               mainAxisSpacing: 10,
//                               crossAxisSpacing: 10,
//                               childAspectRatio: 1 / .5,
//                             ),
//                             padding: EdgeInsets.all(0),
//                             physics: NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               final tags = property.tags;
//                               return tagWidget(tagContent: tags![index]);
//                             },
//                             itemCount: property.tags!.length,
//                           ),
//                           customSpaces.verticalspace20,
//                         ],
//                       ),
//                     ),

//                     //
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             height: 80,
//             decoration: BoxDecoration(
//               border: Border(
//                 top: BorderSide(
//                   color: Colors.grey.shade300,
//                   width: 1,
//                 ),
//               ),
//             ),
//             child: Padding(
//               padding: customPaddings.horizontalpadding20,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Price',
//                             style: AppFonts.SecondaryColorText14,
//                           ),
//                           Text(
//                             Utils.formatPrice(property.propertyPrice),
//                             style: AppFonts.SecondaryColorText20,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   customSpaces.horizontalspace20,
//                   Expanded(
//                     child: Container(
//                       child: PrimaryButton(
//                         buttonText: 'Send Enquiry',
//                         buttonFunction: () async {
//                           // await openEnquiryBottomSheet(
//                           //     context, property);
//                           // // await Future.delayed(Duration(seconds: 3));
//                           // print('here 2');

//                           // Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _launchDirections(double latitude, double longitude) async {
//     final url =
//         'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       throw 'Could not launch Google Maps';
//     }
//   }

//   void launchPhoneCall(String phoneNumber) async {
//     final url = 'tel:$phoneNumber';
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       throw 'Could not launch phone call';
//     }
//   }

//   // openEnquiryBottomSheet(context, PropertyModel property) async {
//   //   TextEditingController message = TextEditingController();

//   //   print('here 1');
//   //   showModalBottomSheet(
//   //     isScrollControlled: true,
//   //     shape: RoundedRectangleBorder(
//   //         borderRadius: BorderRadius.only(
//   //       topLeft: Radius.circular(20),
//   //       topRight: Radius.circular(20),
//   //     )),
//   //     context: context,
//   //     builder: (context) {
//   //       return Padding(
//   //         padding:
//   //             EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//   //         child: Container(
//   //           child: Padding(
//   //             padding: customPaddings.horizontalpadding20,
//   //             child: BlocBuilder<PropertyBloc, PropertyState>(
//   //               builder: (context, state) {
//   //                 if (state is PropertyInitial) {
//   //                   return Column(
//   //                     mainAxisSize: MainAxisSize.min,
//   //                     children: [
//   //                       customSpaces.verticalspace30,
//   //                       CustomMultiLineInputField(
//   //                           hintText: 'Enter Your Message',
//   //                           fieldIcon: PropertifyIcons.chat,
//   //                           controller: message,
//   //                           maxLines: 5),
//   //                       customSpaces.verticalspace20,
//   //                       PrimaryButton(
//   //                         buttonText: 'Send Enquiry',
//   //                         buttonFunction: () {
//   //                           if (message.text.isEmpty) {
//   //                             showCustomToast(context, 'Please Enter Some Info',
//   //                                 AppColors.alertColor);
//   //                           }
//   //                           if (message.text.isNotEmpty) {
//   //                             CreateRequest request = CreateRequest(
//   //                               agentId: property.agent!.id,
//   //                               userId: userId,
//   //                               propertyId: property.id,
//   //                               requestName: message.text,
//   //                             );
//   //                             context
//   //                                 .read<PropertyBloc>()
//   //                                 .add(sendRequstEvent(request: request));
//   //                           }
//   //                         },
//   //                       ),
//   //                       customSpaces.verticalspace20,
//   //                     ],
//   //                   );
//   //                 } else if (state is ProperyRequstSendState) {
//   //                   return Container(
//   //                     height: 200,
//   //                     child: Center(
//   //                         child: Column(
//   //                       mainAxisAlignment: MainAxisAlignment.center,
//   //                       children: [
//   //                         CircleAvatar(
//   //                             backgroundColor: Colors.green.shade100,
//   //                             child: Icon(
//   //                               Icons.check,
//   //                               color: Colors.green.shade800,
//   //                             )),
//   //                         customSpaces.verticalspace20,
//   //                         Text(
//   //                           state.message,
//   //                           style: AppFonts.PrimaryColorText16,
//   //                           textAlign: TextAlign.center,
//   //                         ),
//   //                       ],
//   //                     )),
//   //                   );
//   //                 } else if (state is RequestSendPopState) {
//   //                   Navigator.pop(context);
//   //                 } else if (state is RequestErrorState) {
//   //                   print(state.message);
//   //                   return Container(
//   //                     height: 100,
//   //                     child: Center(
//   //                         child: Text(
//   //                       state.message,
//   //                       style: AppFonts.RedColorText16,
//   //                       textAlign: TextAlign.center,
//   //                     )),
//   //                   );
//   //                 }

//   //                 return SizedBox();
//   //               },
//   //             ),
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }

//   _addToFavourites() async {
//     //   String propertyId = property.id!;
//     //   String? userId = await SharedPref.instance.getUserId();

//     //   Map<String, dynamic> favourite = {
//     //     "userId": userId,
//     //     "propertyId": propertyId
//     //   };
//     //   print(favourite);
//     //  final  response = PropertyRepo().addToFavourites(favourite);
//     //   response.fold((left) => print(left), (right) {
//     //     showCustomToast(context, 'Added to Favourites');
//     //   });
//   }
// }

class tagWidget extends StatelessWidget {
  final String? tagContent;
  const tagWidget({
    super.key,
    this.tagContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      alignment: Alignment.center,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black)),
      child: Text(tagContent ?? ''),
    );
  }
}

class IconwithText extends StatelessWidget {
  final String? contentText;
  final IconData? contentIcon;

  const IconwithText({
    super.key,
    this.contentText,
    this.contentIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          contentIcon,
          size: 16,
        ),
        customSpaces.horizontalspace10,
        Text(
          contentText ?? '',
          style: AppFonts.SecondaryColorText14,
        )
      ],
    );
  }
}

Map<String, Icon> amenityIcons = {
  'Gym': Icon(Icons.fitness_center,
      color: AppColors.secondaryColor), // Specify color
  'Swimming Pool':
      Icon(Icons.pool, color: AppColors.secondaryColor), // Specify color
  'Parking': Icon(Icons.wifi, color: AppColors.secondaryColor), // Specify color
  // Add more mappings as needed
};

class CustomOverlayScreen extends StatelessWidget {
  final PropertyModel property;
  CustomOverlayScreen({required this.property});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Transparent container to capture taps outside the drawer
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // Close the overlay when tapping outside
          },
          child: Container(
            color: Colors.transparent,
          ),
        ),
        // Drawer content
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.30,
            child: Drawer(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '${property.propertyCoverPicture!.path}'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.center,
                                      stops: [0.0, 1.0],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: 40,
                                  child: CustomIconBox(
                                    boxheight: 40,
                                    boxwidth: 40,
                                    boxIcon: Icons.arrow_back,
                                    radius: 8,
                                    boxColor: Colors.transparent,
                                    iconSize: 24,
                                    IconColor: Colors.white,
                                    iconFunction: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Positioned(
                                  right: 20,
                                  top: 40,
                                  child: Row(
                                    children: [
                                      CustomIconBox(
                                        boxheight: 40,
                                        boxwidth: 40,
                                        boxIcon: Icons.bookmark_border,
                                        radius: 8,
                                        boxColor: Colors.transparent,
                                        iconSize: 24,
                                        IconColor: Colors.white,
                                        iconFunction: () async {
                                          // await _addToFavourites();
                                        },
                                      ),
                                      // CustomIconBox(
                                      //   boxheight: 40,
                                      //   boxwidth: 40,
                                      //   boxIcon: Icons.share_outlined,
                                      //   radius: 8,
                                      //   boxColor: Colors.transparent,
                                      //   iconSize: 24,
                                      //   IconColor: Colors.white,
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            customSpaces.verticalspace20,
                            Padding(
                              padding: customPaddings.horizontalpadding20,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1 / 1,
                                ),
                                itemBuilder: (context, index) {
                                  if (index <
                                      property
                                          .propertyGalleryPictures!.length) {
                                    // Check if the index is within the bounds of the list
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image(
                                        height: 140,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            '${property.propertyGalleryPictures![index].path}'),
                                      ),
                                    );
                                  } else {
                                    // If index is out of bounds, you can display a placeholder or empty container
                                    return Container(); // Empty container
                                  }
                                },
                                itemCount:
                                    property.propertyGalleryPictures!.length,
                                shrinkWrap: true,
                              ),
                            ),
                            customSpaces.verticalspace20,

                            Padding(
                              padding: customPaddings.horizontalpadding20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 6),
                                        decoration: BoxDecoration(
                                            color: AppColors.secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          property.propertyCategory,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      customSpaces.horizontalspace10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            PropertifyIcons.location,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                          customSpaces.horizontalspace5,
                                          Text(
                                            property.propertyCity,
                                            style: AppFonts.greyText14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  customSpaces.verticalspace5,
                                  Text(
                                    property.propertyName,
                                    style: AppFonts.SecondaryColorText24,
                                  ),
                                ],
                              ),
                            ),
                            customSpaces.verticalspace10,
                            Padding(
                              padding: customPaddings.horizontalpadding20,
                              child: Row(
                                children: [
                                  IconwithText(
                                    contentIcon: PropertifyIcons.sqft,
                                    contentText: '1848 sqft',
                                  ),
                                  customSpaces.horizontalspace20,
                                  IconwithText(
                                    contentIcon: PropertifyIcons.bed,
                                    contentText: '3 Rooms',
                                  ),
                                  customSpaces.horizontalspace20,
                                  IconwithText(
                                    contentIcon: Icons.shower_outlined,
                                    contentText: '2 Bathrooms',
                                  ),
                                ],
                              ),
                            ),
                            customSpaces.verticalspace10,
                            Divider(),
                            customSpaces.verticalspace10,

                            Padding(
                              padding: customPaddings.horizontalpadding20,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        child: Text(
                                          // Add Text widget inside the CircleAvatar
                                          property.agent!.name != null &&
                                                  property
                                                      .agent!.name!.isNotEmpty
                                              ? property.agent!.name![0]
                                                  .toUpperCase()
                                              : 'D', // Use the first letter or 'D' for Default
                                          style: AppFonts.WhiteColorText16,
                                        ),
                                      ),
                                      customSpaces.horizontalspace20,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          customSpaces.verticalspace5,
                                          Text(
                                            'Listing Agent',
                                            style:
                                                AppFonts.SecondaryColorText10,
                                          ),
                                          Text(
                                            property.agent!.name ?? 'Default',
                                            style:
                                                AppFonts.SecondaryColorText24,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomIconBox(
                                        boxheight: 50,
                                        boxwidth: 50,
                                        boxIcon: Icons.call_outlined,
                                        radius: 8,
                                        boxColor: Colors.grey.shade200,
                                        iconSize: 24,
                                        IconColor: AppColors.secondaryColor,
                                        iconFunction: () {
                                          launchPhoneCall(
                                              property.agent!.phone!);
                                        },
                                      ),
                                      customSpaces.horizontalspace10,
                                      CustomIconBox(
                                        boxheight: 50,
                                        boxwidth: 50,
                                        boxIcon:
                                            Icons.messenger_outline_rounded,
                                        radius: 8,
                                        boxColor: Colors.grey.shade200,
                                        iconSize: 24,
                                        IconColor: AppColors.secondaryColor,
                                        iconFunction: () {
                                          // Navigator.of(context).push(MaterialPageRoute(
                                          //   builder: (context) => ComingSoon(),
                                          // ));
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            customSpaces.verticalspace10,
                            Divider(),
                            customSpaces.verticalspace10,

                            Padding(
                              padding: customPaddings.horizontalpadding20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Overview',
                                    style: AppFonts.SecondaryColorText20,
                                  ),
                                  customSpaces.verticalspace10,
                                  Text(
                                    property.propertyDescription!,
                                    textAlign: TextAlign.justify,
                                    style: AppFonts.greyText14,
                                  ),
                                ],
                              ),
                            ),
                            customSpaces.verticalspace20,

                            Padding(
                              padding: customPaddings.horizontalpadding20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Location',
                                    style: AppFonts.SecondaryColorText20,
                                  ),
                                  customSpaces.verticalspace20,
                                  GestureDetector(
                                    onTap: () async {
                                      await _launchDirections(
                                        double.parse(
                                            property.latitude ?? '0.0'),
                                        double.parse(
                                            property.longitude ?? '0.0'),
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 200,
                                        child: GoogleMap(
                                          padding: EdgeInsets.all(10),
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng(
                                              double.parse(
                                                  property.latitude ?? '0.0'),
                                              double.parse(
                                                  property.longitude ?? '0.0'),
                                            ),
                                            zoom: 10,
                                          ),
                                          markers: <Marker>[
                                            Marker(
                                              markerId:
                                                  MarkerId('property_location'),
                                              position: LatLng(
                                                double.parse(
                                                    property.latitude ?? '0.0'),
                                                double.parse(
                                                    property.longitude ??
                                                        '0.0'),
                                              ),
                                              infoWindow: InfoWindow(
                                                title: property.propertyName,
                                              ),
                                            ),
                                          ].toSet(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  customSpaces.verticalspace20,
                                  Text(
                                    'Features & Amentities',
                                    style: AppFonts.SecondaryColorText20,
                                  ),
                                  customSpaces.verticalspace20,
                                  ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final amenities = property.amenities;
                                      final amenity = amenities![index];

                                      Icon? amenityIcon = amenityIcons[amenity];

                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Container(
                                          color: Colors.grey.shade200,
                                          child: ListTile(
                                            leading:
                                                amenityIcon, // Use the icon as leading
                                            title: Text(amenity),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: property.amenities!.length,
                                  ),
                                  customSpaces.verticalspace20,
                                  Text(
                                    'Tags',
                                    style: AppFonts.SecondaryColorText20,
                                  ),
                                  customSpaces.verticalspace20,
                                  GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 1 / .5,
                                    ),
                                    padding: EdgeInsets.all(0),
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final tags = property.tags;
                                      return tagWidget(
                                          tagContent: tags![index]);
                                    },
                                    itemCount: property.tags!.length,
                                  ),
                                  customSpaces.verticalspace20,
                                ],
                              ),
                            ),

                            //
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: customPaddings.horizontalpadding20,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Price',
                                    style: AppFonts.SecondaryColorText14,
                                  ),
                                  Text(
                                    Utils.formatPrice(property.propertyPrice),
                                    style: AppFonts.SecondaryColorText20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          customSpaces.horizontalspace20,
                          Expanded(
                            child: Container(
                              child: PrimaryButton(
                                buttonText: 'Send Enquiry',
                                buttonFunction: () async {
                                  // await openEnquiryBottomSheet(
                                  //     context, property);
                                  // // await Future.delayed(Duration(seconds: 3));
                                  // print('here 2');

                                  // Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

_launchDirections(double latitude, double longitude) async {
  final url =
      'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch Google Maps';
  }
}

void launchPhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch phone call';
  }
}
