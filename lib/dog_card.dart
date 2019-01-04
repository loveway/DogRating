import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dog_detail.dart';

class DogCard extends StatefulWidget {
  final Dog dog;
  DogCard(this.dog);
  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
  Dog dog;
  _DogCardState(this.dog);
  String renderUrl;

  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();
    setState(() {
      renderUrl = dog.imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _tapDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          height: 115,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 60,
                child: dogCard,
              ),
              Positioned(
                left: 10,
                top: 7.5,
                child: dogImage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapDogDetailPage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DogDetailPage(widget.dog)));
  }

  Widget get dogImage {
    var dogAvatar = Hero(
      tag: dog,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(renderUrl ?? ''),
      ),
    );

    var placeholder = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black54, Colors.black, Colors.blueGrey[600]],
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'DOGGO',
        textAlign: TextAlign.center,
      ),
    );

    return AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 1000),
    );
  }

  Widget get dogCard {
    return Container(
      width: 280,
      height: 115,
      // color: Colors.white,
      child: Card(
        // elevation: 5,
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name,
                  style: Theme.of(context).textTheme.headline),
              Text(widget.dog.location,
                  style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.dog.rating} / 10'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
