import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:proseekr/src/i18n/app_translations.dart';
import 'package:proseekr/src/models/globals.dart' as globals;
import 'package:proseekr/src/views/provider/image_upload_view.dart';

class UserRegistration extends StatefulWidget {
  UserRegistration({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextStyle style = TextStyle(fontSize: 14.0);
  final TextEditingController _firstNameFilter = new TextEditingController();
  final TextEditingController _lastNameFilter = new TextEditingController();

  final TextEditingController _storeNameFilter = new TextEditingController();
  final TextEditingController _address1Filter = new TextEditingController();
  final TextEditingController _cityFilter = new TextEditingController();
  final TextEditingController _stateFilter = new TextEditingController();
  final TextEditingController _pincodeFilter = new TextEditingController();

  final TextEditingController _contactFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _confirmPasswordFilter =
      new TextEditingController();
  final TextEditingController _emailFilter = new TextEditingController();
  List<String> _genders = ['Male', 'Female', 'Others'];
  String _selectedGender;

  void dispose() {
    _firstNameFilter.dispose();
    _lastNameFilter.dispose();
    _storeNameFilter.dispose();
    _address1Filter.dispose();
    _cityFilter.dispose();
    _stateFilter.dispose();
    _pincodeFilter.dispose();
    _contactFilter.dispose();
    _passwordFilter.dispose();
    _confirmPasswordFilter.dispose();
    _emailFilter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _validateEmail(String value) {
      print("email validator called"); // TODO: Remove logs
      String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
          "\\@" +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
          "(" +
          "\\." +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
          ")+";
      RegExp regExp = new RegExp(p);

      if (regExp.hasMatch(value)) {
        return null;
      }
      return 'Email is not valid';
    }

    String _phoneNumberValidator(String value) {
      Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
      RegExp regex = new RegExp(pattern);
      if (value.isEmpty || !regex.hasMatch(value))
        return 'Enter Valid Phone Number';
      else
        return null;
    }

    String _validatePassword(String password, String confirmPassword) {
      if (password.isEmpty || confirmPassword.isEmpty)
        return 'Enter your password';
      else if (password != confirmPassword)
        return 'Passwords do not match';
      else
        return null;
    }

    void _showDialog() {
      Fluttertoast.showToast(
          msg: "Please enter all the fields",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    bool _autoValidate = false;

    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        title: Text(AppTranslations.of(context).text("provider_registration")),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: KeyboardAvoider(
          autoScroll: true,
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  Center(
                    child: Text(
                        AppTranslations.of(context)
                                .text("personal_information") ??
                            "Personal Information",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          obscureText: false,
                          style: TextStyle(color: Colors.white),
                          controller: _firstNameFilter,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black,
                              prefixIcon:
                                  new Icon(Icons.person, color: Colors.white),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: AppTranslations.of(context)
                                  .text("first_name"),
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(4.0))),
                          validator: (value) {
                            print('validator called'); // TODO: Remove logs
                            if (value.isEmpty) {
                              return 'Please enter your First name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(globals.PADDING)),
                      Expanded(
                        child: SingleChildScrollView(
                          child: TextFormField(
                            obscureText: false,
                            style: TextStyle(color: Colors.white),
                            controller: _lastNameFilter,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                prefixIcon:
                                    new Icon(Icons.person, color: Colors.white),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: AppTranslations.of(context)
                                    .text("last_name"),
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(style: BorderStyle.none),
                                    borderRadius: BorderRadius.circular(4.0))),
                            validator: (value) {
                              print('validator called'); // TODO: Remove logs
                              if (value.isEmpty) {
                                return 'Please enter your Last name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  Center(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: DropdownButton(
                      elevation: 0,
                      underline: Container(
                        height: 0,
                      ),
                      hint: Text(AppTranslations.of(context)
                          .text("gender")), // Not necessary for Option 1
                      value: _selectedGender,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedGender = newValue;
                          globals.provider.setGender(_selectedGender);
                        });
                      },
                      items: _genders.map((gender) {
                        return DropdownMenuItem(
                          child: new Text(gender),
                          value: gender,
                        );
                      }).toList(),
                    ),
                  )),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  Center(
                    child: Text(
                        AppTranslations.of(context).text("store_details"),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    controller: _storeNameFilter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon: new Icon(Icons.store, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText:
                            AppTranslations.of(context).text("store_name"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      print('validator called'); // TODO: Remove logs
                      if (value.isEmpty) {
                        return 'Please enter the Store name';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    controller: _address1Filter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon: new Icon(Icons.home, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText:
                            AppTranslations.of(context).text("address_line"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      print('validator called'); // TODO: Remove logs
                      if (value.isEmpty) {
                        return 'Please enter the Address';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    controller: _cityFilter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon:
                            new Icon(Icons.location_city, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: AppTranslations.of(context).text("city"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      print('validator called'); // TODO: Remove logs
                      if (value.isEmpty) {
                        return 'Please enter the City';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    controller: _stateFilter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon:
                            new Icon(Icons.location_on, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: AppTranslations.of(context).text("state"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      print('validator called'); // TODO: Remove logs
                      if (value.isEmpty) {
                        return 'Please enter the State';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    controller: _pincodeFilter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon:
                            new Icon(Icons.location_on, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: AppTranslations.of(context).text("pin_code"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      print('validator called'); // TODO: Remove logs
                      if (value.isEmpty) {
                        return 'Please enter the Pincode';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  Center(
                      child: Text(
                          AppTranslations.of(context)
                              .text("contact_information"),
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    controller: _contactFilter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon: new Icon(Icons.call, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: AppTranslations.of(context).text("contact"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      print('validator called'); // TODO: Remove logs
                      if (value.isNotEmpty) {
                        return _phoneNumberValidator(value);
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    controller: _passwordFilter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon: new Icon(Icons.lock, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: AppTranslations.of(context).text("password"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      print('validator called'); // TODO: Remove logs
                      if (value.isEmpty) {
                        return 'Please enter your Password';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    controller: _confirmPasswordFilter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon: new Icon(Icons.lock, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: AppTranslations.of(context)
                            .text("confirm_password"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      print('validator called'); // TODO: Remove logs
                      if (value.isNotEmpty || value.isEmpty) {
                        return _validatePassword(
                            _passwordFilter.text, _confirmPasswordFilter.text);
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  TextFormField(
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailFilter,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black,
                        prefixIcon:
                            new Icon(Icons.mail_outline, color: Colors.white),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: AppTranslations.of(context).text("email"),
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(4.0))),
                    validator: (value) {
                      if (value.isNotEmpty) {
                        return _validateEmail(value);
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                  Center(
                    child: Material(
                      shape: CircleBorder(),
                      color: Colors.black,
                      child: MaterialButton(
                        elevation: 8.0,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            globals.provider
                                .setFirstName(_firstNameFilter.text);
                            globals.provider.setLastName(_lastNameFilter.text);
                            globals.provider
                                .setStoreName(_storeNameFilter.text);
                            globals.provider
                                .setAddressLine(_address1Filter.text);
                            globals.provider.setCity(_cityFilter.text);
                            globals.provider.setState(_stateFilter.text);
                            globals.provider.setPincode(_pincodeFilter.text);
                            globals.provider.setContact(_contactFilter.text);
                            globals.provider.setEmail(_emailFilter.text);
                            globals.provider.setPassword(_passwordFilter.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageUpload()),
                            );
                            //  print('No error');// TODO: Remove logs
                          } else {
                            _showDialog();
                          }
                        },
                        child:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(globals.PADDING)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
