import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify_webapp/blocs/property_bloc/property_bloc.dart';
import 'package:propertify_webapp/resources/components/custom_appbar.dart';
import 'package:propertify_webapp/views/screen1.dart';
import 'package:propertify_webapp/views/screen2.dart';
import 'package:propertify_webapp/views/screen3.dart';
import 'package:propertify_webapp/views/screen4.dart';

class DesktopDashboard extends StatefulWidget {
  @override
  _DesktopDashboardState createState() => _DesktopDashboardState();
}

class _DesktopDashboardState extends State<DesktopDashboard> {
  @override
  void initState() {
    BlocProvider.of<PropertyBloc>(context).add(LoadPropertiesEvent());
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _screens = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

// var height =  MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Row(
        children: [
          Drawer(
            backgroundColor: Colors.white,
            width: MediaQuery.of(context).size.width * .15,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Dashboard',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.home_max,
                            size: 20,
                          ),
                          title: Text(
                            'Properties',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          onTap: () {
                            _selectScreen(0);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person_outline_rounded,
                            size: 20,
                          ),
                          title: Text(
                            'Agents',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          onTap: () {
                            _selectScreen(1);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person_outline_rounded,
                            size: 20,
                          ),
                          title: Text(
                            'Users',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          onTap: () {
                            _selectScreen(2);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.settings_outlined,
                            size: 20,
                          ),
                          title: Text(
                            'Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          onTap: () {
                            _selectScreen(3);
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.output_rounded,
                        size: 20,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: _screens[_currentIndex],
          ),
          // Row(
          //   children: [
          //     Container(
          //       width: MediaQuery.of(context).size.width * .2,
          //       color: Colors.grey.shade200,
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }

  void _selectScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
