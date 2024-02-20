// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify_webapp/blocs/property_bloc/property_bloc.dart';
import 'package:propertify_webapp/models/property_model.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<PropertyBloc, PropertyState>(
                    builder: (context, state) {
                      final map = (state is PropertyLoadSuccessState)
                          ? {
                              'Properties': state.properties!.length.toString(),
                              'SoldProperties': state.soldProperties,
                            }
                          : {};
                      return Row(
                        children: [
                          dashboardBox(
                            bgColor: Colors.amber.shade50,
                            boxIcon: Icons.home_max_outlined,
                            title: 'Properties',
                            subTitle: map['Properties'] ?? '',
                          ),
                          dashboardBox(
                            bgColor: Colors.amber.shade50,
                            boxIcon: Icons.check,
                            title: 'Sold',
                            subTitle: map['SoldProperties'] ?? '',
                          ),
                          dashboardBox(
                            bgColor: Colors.amber.shade50,
                            boxIcon: Icons.timelapse_outlined,
                            title: 'Pending',
                            subTitle: '08',
                          ),
                        ],
                      );
                    },
                  ),
                  dashboardBox(
                    bgColor: Colors.amber.shade50,
                    boxIcon: Icons.person_outline_outlined,
                    title: 'Users',
                    subTitle: '10',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: 400,
                      child: TabBar(
                        labelPadding: EdgeInsets.all(0),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: ShapeDecoration(
                          shape: Border(
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        unselectedLabelStyle:
                            TextStyle(fontSize: 14, color: Colors.grey),
                        dividerColor: Colors.transparent,
                        tabs: [
                          Tab(
                            text: 'All Properties',
                          ),
                          Tab(text: 'Approved'),
                          Tab(text: 'Rejected'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content of Tab 1
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: Color.fromARGB(255, 238, 238, 238),
                          child: Column(
                            children: [
                              // Add your content for Tab 1 here

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: BlocBuilder<PropertyBloc, PropertyState>(
                                  buildWhen: (previous, current) =>
                                      current is! PropertyApprovedSuccessState,
                                  builder: (context, state) {
                                    if (state is PropertyLoadingState) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    } else if (state
                                        is PropertyLoadSuccessState) {
                                      return ListView.separated(
                                        padding: EdgeInsets.all(0),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return Divider(
                                            height: 0,
                                            thickness: .5,
                                          );
                                        },
                                        itemBuilder: (context, index) {
                                          PropertyModel property =
                                              state.properties![index];
                                          return propertyItem(
                                            index: index + 1,
                                            property: property,
                                          );
                                        },
                                        itemCount: state.properties!.length,
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Content of Tab 2
                  Column(
                    children: [
                      // Add your content for Tab 2 here
                    ],
                  ),
                  // Content of Tab 3
                  Column(
                    children: [
                      // Add your content for Tab 3 here
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class dashboardBox extends StatelessWidget {
  Color? bgColor;
  IconData? boxIcon;
  String? title;
  String? subTitle;
  dashboardBox({
    this.bgColor,
    this.boxIcon,
    this.subTitle,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade100)),
      width: MediaQuery.of(context).size.width * .20,
      height: MediaQuery.of(context).size.height * .15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: bgColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  boxIcon,
                  size: 30,
                ),
              )),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                subTitle ?? '',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.w900),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class propertyItem extends StatelessWidget {
  final dynamic? index;
  final PropertyModel property;
  late ValueNotifier<Map<String, bool>> valueStatus;
  propertyItem({
    required this.index,
    required this.property,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    valueStatus = ValueNotifier(checkStatus());
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return CustomOverlayScreen(
                Property: property,
              );
            },
            transitionsBuilder: (___, animation, ____, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border(
          //     left: BorderSide(
          //   // color: Colors.green,
          //   width: 4,
          // ))
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 20,
                  child: Text(
                    '${index}',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    property!.propertyCoverPicture!.path,
                    height: 40,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    property!.propertyName,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.location_on_rounded,
                  size: 15,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Malappuram',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '₹ 10,000',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 60,
                ),
                CircleAvatar(
                  radius: 15,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Michael Angelo',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            BlocListener<PropertyBloc, PropertyState>(
              listener: (context, state) {
                print(state);
                if (state is PropertyApprovedSuccessState) {
                  valueStatus.value['isApproved'] = true;
                  valueStatus.notifyListeners();
                  print(valueStatus.value);
                }
              },
              child: ValueListenableBuilder(
                valueListenable: valueStatus,
                builder: (context, value, child) {
                  print(value);
                  if (!value['isApproved']! && !value['isRejected']!) {
                    return Row(
                      children: [
                        statusButton(
                          bgColor: Colors.red.shade200,
                          labelColor: Colors.red.shade900,
                          label: 'Reject',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        statusButton(
                          bgColor: Colors.green.shade200,
                          label: 'Approve',
                          labelColor: Colors.green.shade900,
                          onPressed: () {
                            context.read<PropertyBloc>().add(
                                ApprovePropertyEvent(PropertyId: property.id!));
                          },
                        ),
                      ],
                    );
                  } else if (value['isApproved']!) {
                    return statusButton(
                      bgColor: Colors.green.shade700,
                      label: 'Approved',
                      labelColor: Colors.white,
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkStatus() {
    Map<String, bool> status = {
      'isApproved': property.isApproved!,
      'isRejected': property.isRejected!,
      'isSold': property.isSold!,
    };
    return status;
  }
}

class statusButton extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color labelColor;
  final VoidCallback? onPressed;
  statusButton({
    super.key,
    required this.label,
    required this.bgColor,
    required this.labelColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          backgroundColor: MaterialStatePropertyAll(bgColor)),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: labelColor,
          fontSize: 12,
        ),
      ),
    );
  }
}

class CustomOverlayScreen extends StatelessWidget {
  final PropertyModel Property;
  CustomOverlayScreen({required this.Property});
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
            width: MediaQuery.of(context).size.width * 0.50,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      Property.propertyName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                    onTap: () {
                      // Handle item tap
                    },
                  ),
                  ListTile(
                    title: Text('Item 2'),
                    onTap: () {
                      // Handle item tap
                    },
                  ),
                  // Add more list items as needed
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
