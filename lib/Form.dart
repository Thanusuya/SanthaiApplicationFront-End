import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class FormData extends StatefulWidget {
  @override
  _FormDataState createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var url = Uri.parse('http://192.168.43.69:8081/upload');

    var res = await http.post(url, headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8'
    }, body: <String, String>{
      'category': form.category,
      'variety': form.variety,
      'gender': form.gender,
      'age': form.age,
      'description': form.description,
      'price': form.price,
      'height': form.height,
      'weight': form.weight,
      'location': form.location,
      'colour': form.colour
    });
    print(res.body);
  }

  Forms form = Forms('', '', '', '', '', '', '', '', '', '');
  File _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile1 = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile1 != null) {
        _image = File(pickedFile1.path);
      } else {
        print('No image selected.');
      }
    });
  }

  upload(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://192.168.43.69:8081/upload");
    var request = new http.MultipartRequest("POST", uri);
    request.fields['category'] = form.category;
    request.fields['age'] = form.age;
    request.fields['variety'] = form.variety;
    request.fields['description'] = form.description;
    request.fields['gender'] = form.gender;
    request.fields['process'] = form.process;
    request.fields['colour'] = form.colour;
    request.fields['height'] = form.height;
    request.fields['weight'] = form.weight;
    request.fields['location'] = form.location;
    request.fields['price'] = form.price;
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));
    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  bool isloaded = false;
  var result;
  fetch() async {
    var url1 = Uri.parse('http://192.168.43.69:8081/image');

    var response = await http.get(url1);
    result = jsonDecode(response.body);
    print(result[0]['image']);
    setState(() {
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "POST".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.green[800]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller:
                              TextEditingController(text: form.category),
                          onChanged: (value) {
                            form.category = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Category'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Select an image".tr()),
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          FlatButton.icon(
                              onPressed: () async => await getImage(),
                              icon: Icon(Icons.camera),
                              label: Text("Gallery".tr())),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: form.variety),
                          onChanged: (value) {
                            form.variety = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Variety'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: form.gender),
                          onChanged: (value) {
                            form.gender = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter gender'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: form.age),
                          onChanged: (value) {
                            form.age = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter age'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: form.process),
                          onChanged: (value) {
                            form.process = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Sell or Adopt'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: form.price),
                          onChanged: (value) {
                            form.price = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Price'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          maxLines: 20,
                          minLines: 1,
                          controller:
                              TextEditingController(text: form.description),
                          onChanged: (value) {
                            form.description = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Description'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: form.height),
                          onChanged: (value) {
                            form.height = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Height'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: form.weight),
                          onChanged: (value) {
                            form.weight = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Weight'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: form.colour),
                          onChanged: (value) {
                            form.colour = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Color'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller:
                              TextEditingController(text: form.location),
                          onChanged: (value) {
                            form.location = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter something'.tr();
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Location'.tr(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.green)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                        child: Container(
                          height: 50,
                          width: 200,
                          child: FlatButton(
                              color: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  save();
                                  upload(_image);
                                } else {
                                  print('not ok');
                                }
                              },
                              child: Text(
                                "POST".tr(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class Forms {
  String process;
  String category;
  String variety;
  String gender;
  String age;
  String description;
  String price;
  String height;
  String weight;
  String location;
  String colour;

  Forms(this.category, this.variety, this.gender, this.age, this.description,
      this.price, this.colour, this.height, this.weight, this.location);
}
