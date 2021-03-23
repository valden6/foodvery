import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              Icon(Icons.menu, color: Colors.black),
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 6.0,
                      spreadRadius: 4.0,
                      offset: Offset(0.0, 3.0)
                    )
                  ],
                  color: Color(0xFFC6E7FE),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/tuxedo.png'),
                    fit: BoxFit.contain
                  )
                )
              )
            ]
          )
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(alignment: Alignment.centerLeft, child: Text('SEARCH FOR',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27.0)))
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(alignment: Alignment.centerLeft, child: Text('RECIPES',style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27.0)))
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  padding: EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 14.0),
                      border: InputBorder.none,
                      fillColor: Colors.grey.withOpacity(0.5),
                      prefixIcon: Icon(Icons.search, color: Colors.grey)
                    )
                  )
                )
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(alignment: Alignment.centerLeft, child: Text('Recommended',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0)))
              ),
              SizedBox(height: 15.0),
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildListItem('Smached Burger', 'assets/icon.png', '15',Color(0xFFFFE9C6), Color(0xFFDA9551)),
                    _buildListItem('Fries', 'assets/fries.png', '5,55',Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                    _buildListItem('Donut', 'assets/doughnut.png', '3,5',Color(0xFFD7FADA), Color(0xFF56CC7E)),
                    _buildListItem('Classic sandwich', 'assets/sandwich.png', '7,5',Color(0xFFFFE9C6), Color(0xFFDA9551)),
                    _buildListItem('Spicy hot dog', 'assets/hotdog.png', '7',Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                    _buildListItem('Taco', 'assets/taco.png', '7,5',Color(0xFFFFE9C6), Color(0xFFDA9551)),

                  ]
                )
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.withOpacity(0.5),
                  labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  unselectedLabelStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
                  tabs: [
                    Tab(child: Text('FEATURED')),
                    Tab(child: Text('COMBO')),
                    Tab(child: Text('FAVORITES')),
                    Tab(child: Text('ORIGINAL')),
                  ]
                )
              ),
              Container(
                height: MediaQuery.of(context).size.width + 135,
                child: TabBarView(
                  controller: tabController, 
                  children: [
                    Container(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          _buildListItemTabBar('Taco', 4.0, '6,5','7,5', 'assets/taco.png'),
                          _buildListItemTabBar('Cheese pizza', 5.0, '11','13', 'assets/pizza.png'),
                          _buildListItemTabBar('Cookie', 3.0, '3','5,99', 'assets/cookie.png'),
                          _buildListItemTabBar('Ice cream', 4.0, '2,5','2,99', 'assets/cream.png')
                        ]
                      )
                    ),
                    Container(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          _buildListItemTabBar('Spicy hot dog', 3.0, '6','7', 'assets/hotdog.png'),
                          _buildListItemTabBar('Fries', 4.0, '4,99','5,55', 'assets/fries.png'),
                          _buildListItemTabBar('Donut', 4.0, '2,99','3,5', 'assets/doughnut.png')
                        ]
                      )
                    ),
                    Container(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          _buildListItemTabBar('Classic sandwich', 5.0, '6,99','7,5', 'assets/sandwich.png'),
                          _buildListItemTabBar('Cheese pizza', 5.0, '11','13', 'assets/pizza.png'),
                          _buildListItemTabBar('Bento', 5.0, '18','22', 'assets/bento.png'),
                          _buildListItemTabBar('Green salad', 5.0, '10,5','12,99', 'assets/salad.png'),
                          _buildListItemTabBar('Pancakes', 5.0, '8,5','9,99', 'assets/pancakes.png')
                        ]
                      )
                    ),
                    Container(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          _buildListItemTabBar('French cheese', 4.0, '4,50','6,5', 'assets/cheese.png'),
                          _buildListItemTabBar('Popcorn', 4.0, '4,99','6,5', 'assets/popcorn.png'),
                          _buildListItemTabBar('Falafel', 3.0, '6,99','8,5', 'assets/falafel.png'),
                          _buildListItemTabBar('Waffle', 4.0, '4,99','6,5', 'assets/waffle.png')
                        ]
                      )
                    )
                  ]
                )
              )
            ]
          ),
        ),
      )
    );
  }

  _buildListItemTabBar(String foodName, double rating, String promoPrice, String price, String imgPath) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFFFFE3DF)
                  ),
                  child: Center(child:Image.asset(imgPath, height: 50.0, width: 50.0))
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(foodName,style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400)),
                    SmoothStarRating(
                      allowHalfRating: true,
                      onRated: (v) {},
                      starCount: rating.toInt(),
                      rating: rating,
                      color: Color(0xFFFFD143),
                      borderColor: Color(0xFFFFD143),
                      size: 15.0,
                      spacing: 0.0
                    ),
                    Row(
                      children: <Widget>[
                        Text('\$' + promoPrice,style: GoogleFonts.lato(fontSize: 16.0,fontWeight: FontWeight.w600,textStyle: TextStyle(color: Color(0xFFF68D7F)))),
                        SizedBox(width: 3.0),
                        Text('\$' + price,style: GoogleFonts.lato(fontSize: 12.0,decoration: TextDecoration.lineThrough,fontWeight: FontWeight.w600,textStyle: TextStyle(color: Colors.grey.withOpacity(0.4))))
                      ]
                    )
                  ]
                )
              ]
            )
          ),
          FloatingActionButton(
            heroTag: foodName,
            mini: true,
            onPressed: () {},
            child: Center(
              child: Icon(Icons.add, color: Colors.white)
            ),
            backgroundColor: Color(0xFFFE7D6A),
          )
        ]
      )
    );
  }

  _buildListItem(String foodName, String imgPath, String price, Color bgColor,Color textColor) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: InkWell(
        onTap: () {
          //ToDo
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => BurgerPage(heroTag: foodName, foodName: foodName, pricePerItem: price, imgPath: imgPath)
          // ));
        },
        child: Container(
          height: 175.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: bgColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: foodName,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    shape: BoxShape.circle
                  ),
                  child: Center(child: Image.asset(imgPath,height: 50.0, width: 50.0))
                )
              ),
              SizedBox(height: 25.0),
              Text(foodName,style: TextStyle(fontSize: 17.0, color: textColor)),
              Text('\$' + price,style: TextStyle(fontSize: 17.0, color: textColor))
            ]
          )
        )
      )
    );
  }
}
