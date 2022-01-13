import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/constants.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import '../models/models.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantScreen({Key key, this.restaurant}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 175.0,
          width: 175.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(menuItem.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Container(
          height: 175.0,
          width: 175.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
                Colors.black54.withOpacity(0.3),
                Colors.black38.withOpacity(0.3),
              ],
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 65.0,
          child: Column(
            children: [
              Text(
                menuItem.name,
                style: kMenuItemName,
              ),
              Text(
                '\$${menuItem.price}',
                style: kMenuItemPrice,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: kRestaurantNameTextStyle,
                    ),
                    Text(
                      '0.2 miles away',
                      style: kRestaurantDistanceTextStyle,
                    ),
                  ],
                ),
                RatingStars(rating: widget.restaurant.rating),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: kRestaurantAddressTextStyle,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Reviews',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Contact',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              'Menu',
              style: kRestaurantMenuHeadingTextStyle,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
