import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/popular_filter_list.dart';

class FilterScreen extends StatefulWidget{
  @override
  _FilterScreenState createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen>{

  RangeValues _rangeValues = RangeValues(100,600);
  double _distanceValue = 5.0;

  List<PopularFilterListData> popularFilterListData = PopularFilterListData.popularFList;
  List<PopularFilterListData> accomodationListData = PopularFilterListData.accomodationList;

  Color lightPurple = Color(0xFFe2d7f5);
  Color darkPurple = Color(0xff7645c7);
  TextStyle _sectionHeaderStyle = TextStyle(
    fontSize: 20,
    color: Colors.black26,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
        title: Text(
          'Filter Options',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:22),
                child: Text(
                  'Price (for 1 night)',
                  style: _sectionHeaderStyle,
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: _rangeValues.start.round(),
                              child: SizedBox(),
                            ),
                            Container(
                              width: 54,
                              child: Text(
                                '\$ ${_rangeValues.start.round()}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 1000-_rangeValues.start.round(),
                              child: SizedBox(),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: _rangeValues.end.round(),
                              child: SizedBox(),
                            ),
                            Container(
                              width: 54,
                              child: Text(
                                '\$ ${_rangeValues.end.round()}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 1000-_rangeValues.end.round(),
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    RangeSlider(
                      values: _rangeValues,
                      min: 0,
                      max: 1000,
                      divisions: 1000,
                      activeColor: darkPurple,
                      inactiveColor: lightPurple,
                      onChanged: (RangeValues values){
                        try{
                          setState(() {
                            _rangeValues = values;
                          });
                        }catch (ex){
                          print(ex.toString()); //TODO
                        }
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 30,
                color: Colors.black54.withOpacity(0.1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  'Populor Filters',
                  style: _sectionHeaderStyle,
                ),
              ),
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Column(
                    children: getPList(),
                  ),
              ),
              Divider(
                height: 30,
                color: Colors.black54.withOpacity(0.1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  'Distance from city center',
                  style: _sectionHeaderStyle,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: _distanceValue.round(),
                          child: SizedBox(),
                        ),
                        Container(
                          width: 170,
                          child: Text(
                            '${_distanceValue.round()/10} kilometers away',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 100 - _distanceValue.round(),
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Slider(
                      value: _distanceValue,
                      activeColor: darkPurple,
                      inactiveColor: lightPurple,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (double value){
                        setState(() {
                          _distanceValue = value;
                        });
                      },
                    ),
                  ],
                )
              ),
              Divider(
                height: 30,
                color: Colors.black54.withOpacity(0.1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Text(
                  'Type of Accomodation',
                  style: _sectionHeaderStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  children: getAccommodationList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16,right: 16,bottom: 16,top: 8),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: darkPurple,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.2),
                        offset: Offset(4,4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          'Apply Filters',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getAccommodationList() {
    List<Widget> noList = List<Widget>();
    for (var i = 0; i < accomodationListData.length; i++) {
      final item = accomodationListData[i];
      noList.add(
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            onTap: () {
              setState(() {
                checkPosition(i);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      item.titleTxt,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Switch(
                    activeColor: item.isSelected ? darkPurple : lightPurple,
                    onChanged: (value) {
                      setState(() {
                        checkPosition(i);
                      });
                    },
                    value: item.isSelected,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      if (i == 0) {
        noList.add(Divider(
          height: 1,
        ));
      }
    }
    return noList;
  }

  void checkPosition(int index) {
    if (index == 0) {
      if (accomodationListData[0].isSelected) {
        accomodationListData.forEach((d) {
          d.isSelected = false;
        });
      } else {
        accomodationListData.forEach((d) {
          d.isSelected = true;
        });
      }
    } else {
      accomodationListData[index].isSelected = !accomodationListData[index].isSelected;

      var count = 0;
      for (var i = 0; i < accomodationListData.length; i++) {
        if (i != 0) {
          var data = accomodationListData[i];
          if (data.isSelected) {
            count += 1;
          }
        }
      }

      if (count == accomodationListData.length - 1) {
        accomodationListData[0].isSelected = true;
      } else {
        accomodationListData[0].isSelected = false;
      }
    }
  }

  List<Widget> getPList() {
    List<Widget> list = List<Widget>();
    var count = 0;
    final columnCount = 2;
    for(var i = 0; i < popularFilterListData.length/columnCount; i++){
      List<Widget> uiLIst = List<Widget>();
      for(var j = 0; j<columnCount; j++){
        try{
          final item = popularFilterListData[count];
          uiLIst.add(
            Expanded(
              child: Row(
                children: <Widget>[
                  Material(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          item.isSelected = !item.isSelected;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              item.isSelected?
                              Icons.check_box : Icons.check_box_outline_blank,
                              color: darkPurple,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item.titleTxt,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
          count++;
        }catch (ex){
          //print(ex.toString());
        }
      }
      list.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: uiLIst,
        )
      );
    }
    return list;
  }
}