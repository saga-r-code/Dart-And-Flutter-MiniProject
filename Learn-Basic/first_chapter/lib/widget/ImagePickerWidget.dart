// This is a Stateful widget which is used to pick images from the device gallery.
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  // This method is used to create the state object for this widget.
  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

// This is the state class for the ImagePickerWidget.
class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  // This is an instance of the ImagePicker class which is used to pick images from the device gallery.
  ImagePicker imagePicker = ImagePicker();

  // This variable is used to store the path of the single image picked from the gallery.
  XFile? singleFile;

  // This variable is used to store the paths of the multiple images picked from the gallery.
  List<XFile>? multiFiles;

  // This method is used to build the UI for this widget.
  @override
  Widget build(BuildContext context) {
    // This is the Scaffold widget which is used to create the basic material design layout.
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Image Picker')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // This is a container widget which is used to display the single image picked from the gallery.
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
              child: singleFile == null
                  ? Text('No Single Image Picked')
                  : Image.file(File(singleFile!.path), fit: BoxFit.cover),
            ),

            // This is an ElevatedButton widget which is used to pick a single image from the gallery.
            ElevatedButton(
              onPressed: () async {
                // This is a function which is used to pick a single image from the gallery.
                final XFile? photo = await imagePicker.pickImage(
                    source: ImageSource.gallery);
                // This is used to update the state of the widget.
                setState(() {
                  singleFile = photo;
                });
                // This is used to print the path of the single image picked from the gallery.
                print("Single Image Path: ${singleFile?.path}");
              },
              child: Text('Pick Single Image From Gallery'),
            ),

            SizedBox(height: 20),

            // This is a container widget which is used to display the multiple images picked from the gallery.
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.green,
              child: multiFiles == null
                  ? Text('No Images Picked')
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: multiFiles!.length,
                      itemBuilder: (context, index) {
                        // This is used to display the images picked from the gallery.
                        return Image.file(
                          File(multiFiles![index].path),
                          fit: BoxFit.cover,
                        );
                      },
                    ),
            ),

            // This is an ElevatedButton widget which is used to pick multiple images from the gallery.
            ElevatedButton(
              onPressed: () async {
                // This is a function which is used to pick multiple images from the gallery.
                final List<XFile>? photos = await imagePicker.pickMultiImage();
                // This is used to update the state of the widget.
                setState(() {
                  multiFiles = photos;
                });
                // This is used to print the paths of the multiple images picked from the gallery.
                if (multiFiles != null) {
                  multiFiles!.forEach((file) {
                    print("Multi Image Path: ${file.path}");
                  });
                }
              },
              child: Text('Pick Multiple Images From Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}

