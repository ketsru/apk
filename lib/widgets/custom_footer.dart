import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:apk/services/api_service.dart';
import 'package:apk/widgets/CustomDropdown.dart';

class BottomSheetContent extends StatefulWidget {
  final String title;

  const BottomSheetContent({Key? key, required this.title}) : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  String selectClass = '';
  String selectMatter = '';

  XFile? _image;
  PlatformFile? _file;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _file = result.files.first;
      });
    }
  }

  Future<void> _submit() async {
    if (_image != null && _file != null) {
      final token = await ApiService.getToken();
      final apiService = ApiService(token: token);

      final Map<String, dynamic> data = {
        'matter': selectMatter,
        'categorie': 'note',
        'idClasse': selectClass,
      };
      print(data);

      final imagePath = _image?.path;
      final filePath = _file?.path;

      if (imagePath != null && filePath != null) {
        // Créez des objets MultipartFile pour l'image et le fichier
        final imageFile = await http.MultipartFile.fromPath('image', imagePath);
        final otherFile = await http.MultipartFile.fromPath('file', filePath);

        // Envoyez la requête
        final response = await apiService.postWithFiles(
          'file',
          data,
          [imageFile, otherFile],
        );

        if (response.statusCode == 200) {
          final responseBody = jsonDecode(response.body);
          if (responseBody['status'] == 1) {
            print(responseBody['message']);
          } else {
            throw Exception(
                'Erreur lors de l\'envoi des données: ${responseBody['message']}');
          }
        } else {
          throw Exception('Erreur lors de la requête: ${response.statusCode}');
        }
      } else {
        print('Les chemins de fichiers sont invalides.');
      }
    } else {
      print('Veuillez sélectionner une image et un fichier.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 6.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF23324F),
                ),
              ),
            ),
            const SizedBox(height: 19.0),
            CustomDropdownExample(
              onClassSelected: (value) {
                setState(() {
                  selectClass = value;
                });
              },
              onMatterSelected: (value) {
                setState(() {
                  selectMatter = value;
                });
              },
            ),
            const SizedBox(height: 19.0),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xffFFECDD),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.image,
                          color: Color(0xFF23324F),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Image',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF23324F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24.0),
                GestureDetector(
                  onTap: _pickFile,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xffEBECEF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.attach_file,
                          color: Color(0xFF23324F),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Fichier',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF23324F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 49.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                ),
                child: const Text(
                  'Envoyer',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final IconData iconData;
  final Color? backColor;

  IconTile({required this.iconData, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          iconData,
          size: 20,
          color: Color(0xFF23324F),
        ),
      ),
    );
  }
}
