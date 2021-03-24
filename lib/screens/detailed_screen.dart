import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedScreen extends StatefulWidget {

  final String imgPath;
  final String foodName;
  final double pricePerItem; 
  final String heroTag;

  DetailedScreen({this.imgPath, this.foodName, this.pricePerItem, this.heroTag});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {

  double netPrice = 0;
  int quantity = 0;
  int quantityCart = 0;
  Icon favouriteIcon = Icon(Icons.favorite_border,color: Color(0xFFFE7D6A), size: 25.0);

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
          netPrice = (netPrice + widget.pricePerItem).toDouble();
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
            netPrice = (netPrice - widget.pricePerItem).toDouble();
          }
        });
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.chevron_left, color: Colors.black,size:35)
              ),
              Stack(
                children: [
                  Container(
                    height: 45.0, 
                    width: 45.0, 
                    color: Colors.transparent
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFE7D6A).withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 4.0)
                        )
                      ], 
                      color: Color(0xFFFE7D6A), 
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child:Icon(Icons.shopping_cart, color: Colors.white)
                    )
                  ),
                  Positioned(
                    top: 1.0,
                    right: 4.0,
                    child: Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle
                      ),
                      child: Center(child: Text(quantityCart.toString(),style: TextStyle(fontSize: 7.0,color: Colors.red)))
                    )
                  )
                ]
              )
            ]
          )
        )
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(widget.foodName.toString().toUpperCase(),style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27.0))
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imgPath),
                      fit: BoxFit.cover
                    )
                  )
                )
              ),
              SizedBox(width: 15.0),
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0, 11.0)
                            )
                          ]
                        )
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if(favouriteIcon.icon == Icons.favorite_border)
                              favouriteIcon = Icon(Icons.favorite,color: Color(0xFFFE7D6A), size: 25.0);
                            else
                              favouriteIcon = Icon(Icons.favorite_border,color: Color(0xFFFE7D6A), size: 25.0);
                          });
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white
                          ),
                          child: Center(
                            child: favouriteIcon
                          )
                        ),
                      )
                    ]
                  ),
                  SizedBox(height: 35.0),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFFE7D6A).withOpacity(0.1),
                              blurRadius: 6.0,
                              spreadRadius: 6.0,
                              offset: Offset(5.0, 11.0)
                            )
                          ]
                        )
                      ),
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(Icons.restore,color: Color(0xFFFE7D6A), size: 25.0),
                        )
                      )
                    ]
                  )
                ]
              )
            ]
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Container(
                height: 70.0,
                width: 125.0,
                color: Colors.white,
                child: Center(
                  child: Text('\$' + netPrice.toString(),style: TextStyle(fontSize: 40.0,color: Color(0xFF5E6166),fontWeight: FontWeight.w500))
                )
              ),
              Container(
                height: 60.0,
                width: 225.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFE7D6A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 105.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            iconSize: 17.0,
                            icon:Icon(Icons.remove, color: Color(0xFFFE7D6A)),
                            onPressed: () {
                              adjustQuantity('MINUS');
                            }
                          ),
                          Text(quantity.toString(),style: TextStyle(fontSize: 14.0,color: Color(0xFFFE7D6A),fontWeight: FontWeight.w400)),
                          IconButton(
                            iconSize: 17.0,
                            icon: Icon(Icons.add, color: Color(0xFFFE7D6A)),
                            onPressed: () {
                              adjustQuantity('PLUS');
                            }
                          )
                        ]
                      )
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantityCart = quantity;                     
                        });
                      },
                      child: Text('Add to cart',style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w400))
                    )
                  ]
                )
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('OTHER FOOD',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700)),
          ),
          Container(
            height: 210,
            child: GridView(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.5
              ),

              children: [
                _buildColumnItem('assets/falafel.png', 'Falafel', "8.5", Color(0xFFFFE9C6)),
                _buildColumnItem('assets/pizza.png', 'Cheese pizza', "13", Color(0xFFFFE9C6)),
                _buildColumnItem('assets/cookie.png', 'Cookie', "5.99", Color(0xFFD7FADA)),
                _buildColumnItem('assets/salad.png', 'Green salad', "12.99", Color(0xFFFFE9C6)),
                _buildColumnItem('assets/bento.png', 'Bento', "22", Color(0xFFFFE9C6)),
                _buildColumnItem('assets/cheese.png', 'French cheese', "6.5", Color(0xFFD7FADA)),
                _buildColumnItem('assets/popcorn.png', 'Popcorn', "6.5", Color(0xFFD7FADA)),
                _buildColumnItem('assets/cream.png', 'Ice cream', "2.99", Color(0xFFD7FADA))
              ],
            )
          )
        ]
      )
    );
  }

  _buildColumnItem(String imgPath, String foodName, String price, Color bgColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 75.0,
            width: 75.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: bgColor
            ),
            child: Center(
              child: Image.asset(imgPath, height: 50.0, width: 50.0)
            )
          ),
          SizedBox(width: 20),
          Container(
            // padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(foodName,style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400)),
                Text('\$' + price,style: GoogleFonts.lato(fontSize: 16.0,fontWeight: FontWeight.w600,textStyle: TextStyle(color: Color(0xFFF68D7F))),
                )
              ]
            )
          )
        ]
      )
    );
  }
}