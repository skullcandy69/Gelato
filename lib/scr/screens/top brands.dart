import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/models/PopularBrands.dart';

List<Brands> brandlist=[
  Brands(name: "Domino's Pizza",image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Dominos_pizza_logo.svg/768px-Dominos_pizza_logo.svg.png',time: 45),
  Brands(name: "Burger King",image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Burger_King_Logo.svg/768px-Burger_King_Logo.svg.png',time: 35),
  Brands(name: "Waffle Factory",image: 'https://i.pinimg.com/originals/af/14/01/af1401e633d29fb37ab6f3abb03d3609.jpg',time: 20),
  Brands(name: "Gaini's",image: 'https://sgp1.digitaloceanspaces.com/quickcompany/trademark/9700032232a88285.jpg',time: 25),
  Brands(name: "Mc Donalds",image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/300px-McDonald%27s_Golden_Arches.svg.png',time: 25),
  Brands(name: "Pizza Hut",image: 'https://upload.wikimedia.org/wikipedia/sco/thumb/d/d2/Pizza_Hut_logo.svg/1200px-Pizza_Hut_logo.svg.png',time: 30),
  Brands(name: "Haldiram's",image: 'https://seeklogo.com/images/H/haldirams-logo-2A7BA0AD2C-seeklogo.com.png',time: 35),

];
class TopBrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Container(
        height: 200,
      child: ListView.builder(
          itemCount: brandlist.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,index){
            return Padding(
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: (){},
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,

                      ),child:Image.network('${brandlist[index].image}',) ,
                    ),
                    SizedBox(height: 10),
                    AutoSizeText(
                      brandlist[index].name,
                      style: TextStyle(
                        color: black,
                        fontSize: 15
                      ),maxLines: 2,
                    ),
                    Text("${brandlist[index].time} mins",style: TextStyle(
                        color: grey,
                        fontSize: 15
                    ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
