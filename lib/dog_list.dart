import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dog_card.dart';

class DogList extends StatelessWidget {
  final List<Dog> dogs;
  DogList(this.dogs);
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: dogs.length,
      itemBuilder: (context, index) {
        return DogCard(dogs[index]);
      },
    );
  }
}
