import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:apk/widgets/custom_app_bar.dart';
import 'package:apk/widgets/custom_profile_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profil',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Page de Profil',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : const AssetImage('assets/images/default_avatar.jpeg') as ImageProvider,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.orange,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ProfileButton(
                title: 'Mes Cours',
                onPressed: () {
                  // Logique pour afficher les cours
                },
                leadingIcon: Icons.book,
                trailingIcon: Icons.arrow_forward,
              ),
              ProfileButton(
                title: 'Mes Notes',
                onPressed: () {
                  // Logique pour afficher les notes
                },
                leadingIcon: Icons.grade,
                trailingIcon: Icons.arrow_forward,
              ),
              ProfileButton(
                title: 'Mes Informations',
                onPressed: () {
                  // Logique pour afficher les informations
                },
                leadingIcon: Icons.info,
                trailingIcon: Icons.arrow_forward,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
