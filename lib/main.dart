import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/real_estate_details.dart';
import 'package:shopping_app/utilities/bottom_nav_bar.dart';
import 'models/real_estate_model.dart';

void main() => runApp(ShoppingApp());

class ShoppingApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping App",
      theme: ThemeData.light().copyWith(
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1,
        )
      ),
      home: ShoppingAppHome(),
    );
  }

}

class ShoppingAppHome extends StatefulWidget{
  @override
  ShoppingAppHomeState createState() {
    return ShoppingAppHomeState();
  }

}

class ShoppingAppHomeState extends State<ShoppingAppHome>{

  PageController _pageController;


  List<RealEstateModel> realEstatesResult = [
    new RealEstateModel(
        img: 'https://rew-feed-images.global.ssl.fastly.net/creb/_cloud_media/listing/detached/c4241465-3-o.jpg',
        address: '088 Alisha Hill Apt. 345',
        name: 'Family House',
        priceOff: '33%'
    ),
    new RealEstateModel(
        img: 'http://www.grandviewriverhouse.com/box/sm/inspiring-european-cottage-style-house-plans-on-interior-decor_bathroom-inspiration.jpg',
        address: '55 Alisha Hill Apt. 345',
        name: 'ArtHouse',
        priceOff: '50%'
    ),
    new RealEstateModel(
        img: 'https://www.ryanhomes.com/rh-community-gallery-NewAspectRatio/969616de-2e2c-4229-8941-05dcfc63f3b5/db/969616de-2e2c-4229-8941-05dcfc63f3b5.jpg',
        address: '088 Alisha Hill Apt. 345',
        name: 'House',
        priceOff: '15%'
    ),
  ];



  List images = [
    AssetImage('images/1.jpg'),
    AssetImage('images/2.jpg'),
    AssetImage('images/3.jpg'),
    AssetImage('images/4.jpg'),
    AssetImage('images/5.jpg'),
  ];

  _itemSelector(int index){
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context,Widget widget){
        double value = 1;
        if(_pageController.position.haveDimensions){
          value = _pageController.page - index;
          value = (1-(value.abs()*0.3)+0.6).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value)*270.0,
            width: Curves.easeInOut.transform(value)*400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0,4.0),
                    blurRadius: 10.0,
                  )
                ]
              ),
              child: Image(
                image: images[index],
                height: 250,
                fit: BoxFit.cover,

              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }


  Widget _buildHeader(){
    return Positioned(
      top: 30,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'Hello',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            SizedBox(width: 5.0,),
            Text(
              'Prateek',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width*0.58,),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35)),
                border: Border.all(
                  width: 2.0,
                  color: Colors.blue
                )
              ),
              child: Icon(
                Icons.person,
                size: 25,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(){
    return Builder(
      builder: (BuildContext context){
        return Positioned(
          top: 90,
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Discover',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    ),
                  ),
                  Text(
                    'Suitable Home',
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFe2d7f5),
                            borderRadius:BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                border:InputBorder.none,
                                prefixIcon: Icon(Icons.search,color: Color(0xff7645c7),),
                                hintText: 'Find a good home',
                                hintStyle:TextStyle(
                                  color: Color(0xff7645c7),
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Color(0xFFe2d7f5),
                        ),
                        child: Icon(Icons.search,color: Color(0xff7645c7),),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: realEstatesResult.length,
                      itemBuilder: (BuildContext context,index) {
                        final RealEstateModel item = realEstatesResult[index];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(item)));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Stack(
                              children: <Widget>[
                                LayoutBuilder(
                                  builder: (BuildContext con, BoxConstraints constraints){
                                    return Hero(
                                      tag: item.name,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.65,
                                        height: constraints.maxHeight - 20,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            topLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                          ),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(item.img),
                                              colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.0),
                                                BlendMode.hardLight,
                                              )
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Positioned(
                                  top: 15,
                                  left: 15,
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(35)),
                                        border: Border.all(
                                            width: 2.0,
                                            color: Colors.white
                                        )
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          item.priceOff,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'OFF',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 35,
                                  left: 15,
                                  width: MediaQuery.of(context).size.width * 0.65,
                                  child: ListTile(
                                      title: Text(
                                        item.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(width: 5,),
                                          Text(
                                            item.address,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: Color(0xfffd8b00),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.navigate_next,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  BottomNavBar(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          _buildHeader(),
          _buildBody(),
        ],
      )
    );
  }
}