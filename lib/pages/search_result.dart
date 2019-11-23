import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/models/real_estate_model.dart';
import 'package:shopping_app/pages/filter_screen.dart';
import 'package:shopping_app/pages/real_estate_details.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SearchResult extends StatefulWidget{

  SearchResult(this.item);
  final List<RealEstateModel> item;
  @override
  _SearchResultState createState() {
    return _SearchResultState();
  }
}

class _SearchResultState extends State<SearchResult> with SingleTickerProviderStateMixin{

  AnimationController animationController;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 5));

  Color lightPurple = Color(0xFFe2d7f5);
  Color darkPurple = Color(0xff7645c7);

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Explore',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.black54,
            ),
            SizedBox(width: 10,),
            Icon(
              Icons.location_on,
              color: Colors.black54,
            ),
            SizedBox(width: 10,),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,//Colors.black12.withOpacity(0.05),
        child: Column(
          children: <Widget>[
            Expanded(
              child: NestedScrollView(
                controller: ScrollController(),
                headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
                  return <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                        return Column(
                          children: <Widget>[
                            _getSearchBar(),
                            _getCalendarView(),
                          ],
                        );
                      },
                        childCount: 1,
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: TabHeader(
                        _getFilterBar(),
                      ),
                    )
                  ];
                },
                body: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.item.length,
                  itemBuilder: (context,index){

                    var count = widget.item.length > 10 ? 10 : widget.item.length;
                    var animation = Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController,
                        curve: Interval(
                          (1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    );
                    animationController.forward();

                    return AnimatedBuilder(
                      animation: animationController,
                      builder: (BuildContext context, Widget child){
                        return FadeTransition(
                          opacity: animation,
                          child: Transform(
                            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => DetailsScreen(widget.item[index])
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        offset: Offset(4, 4),
                                        blurRadius: 16,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            AspectRatio(
                                              aspectRatio: 2,
                                              child: Image.asset(
                                                widget.item[index].img,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              color: Colors.white,
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 16,right: 16, top: 8, bottom: 8),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: <Widget>[
                                                                Text(
                                                                  widget.item[index].name,
                                                                  style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 23,
                                                                    letterSpacing: 0.5,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '\$224',
                                                                  style: TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 23,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: <Widget>[
                                                                Text(
                                                                  widget.item[index].address,
                                                                  style: TextStyle(
                                                                    fontSize: 14,
                                                                    color: Colors.grey.withOpacity(0.7),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 4),
                                                              child: Row(
                                                                children: <Widget>[
                                                                  SmoothStarRating(
                                                                    allowHalfRating: true,
                                                                    starCount: 5,
                                                                    rating: 4,
                                                                    size: 20,
                                                                    color: darkPurple,
                                                                    borderColor: darkPurple,
                                                                  ),
                                                                  SizedBox(width: 5,),
                                                                  Text(
                                                                    "80 Reviews",
                                                                    style: TextStyle(
                                                                      fontSize: 14,
                                                                      color: Colors.grey.withOpacity(0.7),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          top: 15,
                                          right: 15,
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: Colors.grey.withOpacity(0.7),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
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
    );
  }

  Widget _getFilterBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              '153 hotels found',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen(),fullscreenDialog: true));
            },
            child: Row(
              children: <Widget>[
                Text(
                  'Filter',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black54
                  ),
                ),
                SizedBox(width: 5,),
                Icon(
                  Icons.filter_list,
                  color: darkPurple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getCalendarView() {
    return Padding(
      padding: EdgeInsets.only(left: 20,bottom: 10,right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  //TODO
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Choose date',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
            child: Container(
              color: Colors.black54,
              width: 2,
              height: 50,
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  //TODO
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Number of Rooms',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        '1 Room - 2 Adults',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabHeader extends SliverPersistentHeaderDelegate{

  TabHeader(this.header);
  final Widget header;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return header;
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}