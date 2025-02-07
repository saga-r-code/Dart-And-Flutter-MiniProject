import 'package:flutter/material.dart';
import '/widget/Button.dart';
import '/widget/ListGrid.dart';
import 'widget/ContainerAndSizedBox.dart';
import 'widget/RowsAndColumns.dart';
import 'widget/SnackbarWidget.dart';
import 'widget/DismissibleWidget.dart';
import 'widget/Drawer.dart';
import 'widget/ImageWidget.dart';
import 'widget/Alert.dart';
import 'widget/BottomSheetWidget.dart';
import 'widget/AnimationTextWidget.dart';
import 'widget/BottomNavigation.dart';
import 'widget/DropDownWidget.dart';
import 'widget/FormWidget.dart';
import 'widget/StackPosition.dart';
import 'widget/TabbarWidget.dart';
import 'widget/ImagePickerWidget.dart';
import 'widget/LocationWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/button': (context) => Button(),
        '/listgrid': (context) => Listgrid(),
        '/containerandsizedbox': (context) => ConatinerSized(),
        '/Drawer': (context) => DrawerWidget(),
        '/rowsandcolumns': (context) => RowsCols(),
        '/image': (context) => Imagewidget(),
        '/alert': (context) => AlertWidget(),
        '/snackbar': (context) => SnackbarWidget(),
        '/dismissible': (context) => DismissibleWidget(),
        '/bottomsheet': (context) => BottomSheetWidget(),
        '/animationtextw': (context) => AnimationTextWidget(),
        '/bottomnavigation': (context) => Bottomnavigation(),
        '/dropdown': (context) => Dropdownwidget(),
        '/form': (context) => FormWidget(),
        '/stackposition': (context) => StackPosition(),
        '/tabbar': (context) => TabBarWidget(),
        '/imagepicker': (context) => ImagePickerWidget(),
        '/location': (context) => LocationWidget(),
        '/': (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Chapter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/button');
              },
              child: Text('Button'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listgrid');
              },
              child: Text('List And Grid'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/containerandsizedbox');
              },
              child: Text('Container And Sized Box'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Drawer');
              },
              child: Text('Drawer'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/rowsandcolumns');
              },
              child: Text('Rows And Columns'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/image');
              },
              child: Text('Image'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/alert');
              },
              child: Text('Alert'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/snackbar');
              },
              child: Text('Snackbar'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dismissible');
              },
              child: Text('Dismissible'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bottomsheet');
              },
              child: Text('Bottom Sheet'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/animationtextw');
              },
              child: Text('Animation Text Widget'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bottomnavigation');
              },
              child: Text('Bottom Navigation Bar'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dropdown');
              },
              child: Text('Dropdown'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/form');
              },
              child: Text('Form'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stackposition');
              },
              child: Text('Stack Position'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tabbar');
              },
              child: Text('Tab Bar'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/imagepicker');
              },
              child: Text('Image Picker'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/location');
              },
              child: Text('Location'),
            ),
          ],
        ),
      ),
    );
  }
}
