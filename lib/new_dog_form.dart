import 'package:flutter/material.dart';
import 'dog_model.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new dog'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  onChanged: (v) => nameController.text = v,
                  decoration: InputDecoration(
                    labelText: 'Name the Pup',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  onChanged: (v) {
                    locationController.text = v;
                  },
                  decoration: InputDecoration(
                    labelText: 'Pups location',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  onChanged: (v) => descriptionController.text = v,
                  decoration: InputDecoration(
                    labelText: 'All aboout the pup',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => submitUp(context),
                      child: Text('Submit Pup'),
                      color: Colors.indigoAccent,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitUp(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Dog needs name!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      var newDog = Dog(nameController.text, locationController.text,
          descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }
}
