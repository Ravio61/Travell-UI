import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/real_estate_details.dart';
import 'package:shopping_app/pages/search_result.dart';
import 'package:shopping_app/utilities/bottom_nav_bar.dart';
import 'models/real_estate_model.dart';

void main() => runApp(HotelBookingApp());

class HotelBookingApp extends StatelessWidget{
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

  List<RealEstateModel> realEstatesResult = [
    RealEstateModel(
        img: 'hotel/hotel_1.png',
        address: 'Wembly, London',
        name: 'Grand Royal Hotel',
        priceOff: '33%'
    ),
    RealEstateModel(
        img: 'hotel/hotel_2.png',
        address: 'Wembly, London',
        name: 'Queen Hotel',
        priceOff: '50%'
    ),
    RealEstateModel(
        img: 'hotel/hotel_3.png',
        address: 'Wembly, London',
        name: 'Grand Island Hotel',
        priceOff: '20%'
    ),
    RealEstateModel(
        img: 'hotel/hotel_4.png',
        address: 'Wembly, London',
        name: 'Royal King\'s Palace',
        priceOff: '18%'
    ),
    RealEstateModel(
        img: 'hotel/hotel_5.png',
        address: 'Wembly, London',
        name: 'Carnival Hotel',
        priceOff: '45%'
    ),
  ];

  String _searchText;

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
                    'Suitable Hotel',
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
                                hintText: 'Find a good hotel',
                                hintStyle:TextStyle(
                                  color: Color(0xff7645c7),
                                  fontWeight: FontWeight.bold,
                                )
                            ),
                            onChanged: (String value){
                              _searchText = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          if(_searchText != null){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResult(realEstatesResult)));
                          }
                        },
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        splashColor: Color(0xff7645c7),
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            color: Color(0xFFe2d7f5),
                          ),
                          child: Icon(Icons.search,color: Color(0xff7645c7),),
                        ),
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
                                              image: AssetImage(item.img),//TODO
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