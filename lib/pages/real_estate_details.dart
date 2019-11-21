import 'package:flutter/material.dart';
import 'package:shopping_app/models/real_estate_model.dart';

class DetailsScreen extends StatefulWidget{

  DetailsScreen(this.item);
  final RealEstateModel item;
  @override
  _DetailsScreenState createState() {
    return _DetailsScreenState(item);
  }
}

class _DetailsScreenState extends State<DetailsScreen>{

  _DetailsScreenState(this.item);
  final RealEstateModel item;
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: media.size.height,
        width:  media.size.width,
        child: Stack(
          children: <Widget>[
            Container(
              height: media.size.height * 0.45,
              width: media.size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.img),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.hardLight,
                  ),
                ),
              ),
            ),
            Positioned(
              top: media.size.height * 0.4 - 50,
              height: media.size.height * 0.6 + 50,
              width: media.size.width,
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 20, top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  )
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\$4,999',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff632bbf),
                          ),
                        ),
                        Icon(
                          Icons.bookmark_border,
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: media.size.width,
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.shop,
                                size: 12,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                '2',
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '1,200 sq.ft'
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Divider(
                      color: Colors.grey,
                      height: 2,
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: media.size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Home Loan Calculator',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              '\$1,602/month',
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                            subtitle: Text(
                              'Estimated Repayment',
                              style: TextStyle(
                                fontSize: 12
                              )
                            ),
                            trailing: Container(
                              alignment: Alignment.center,
                              width: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 8,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFfed19a),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )
                                    ),
                                  ),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF632bbf),
                                    ),
                                    child: Icon(
                                      Icons.question_answer,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                  Container(
                                    height: 8,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFfed19a),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              //TODO
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFe2d7f5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )
                              ),
                              child: Text(
                                'Ask a Question',
                                style: TextStyle(
                                  color: Color(0xff6732c1),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              //TODO
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xFFe2d7f5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )
                              ),
                              child: Text(
                                'Express Interest',
                                style: TextStyle(
                                  color: Color(0xff6732c1),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}