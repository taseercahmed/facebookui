import 'package:facebookui/Models/MarketModel.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Market Page",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.search),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    print("Search Boutton Click");
                  },
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black26,
        ),
        Expanded(
            child: GridView.count(
          padding: EdgeInsets.all(10),
          primary: false,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
          children: [
            for (var i = 0; i < marketmodel.length; i++) ...[
              InkWell(
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image(image: AssetImage(marketmodel[i].photo)),
                      ),
                      Text(
                        marketmodel[i].tittle,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        marketmodel[i].price.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ]
          ],
        ))
      ],
    );
  }
}
