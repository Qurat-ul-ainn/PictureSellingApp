import 'package:flutter/material.dart';


class CustomTab extends StatefulWidget {
  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> with TickerProviderStateMixin {

  TabController tabController;
  var _currentIndex =0;
  bool small = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(initialIndex: _currentIndex, length: 4, vsync: this);
  //  cInd = widget.tabIndex;
    setState(() {
      tabController = new TabController(
          initialIndex:  0 ,
          length: 4, vsync: this);
       });
  }


@override
void dispose() {
  tabController.dispose();
  super.dispose();
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
           customTabs()
        ],
      ),
    );
  }


//  Widget myTabs(){
//    return Container(
//      child: Center(child: Text('Helo tabs'),),
//    );
//  }

  Widget customTabs(){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
           padding: EdgeInsets.all(10.0),
            margin:  EdgeInsets.all(20.0),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
             // labelStyle: TextStyle(fontSize: 0.5),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.5,
                  color: Colors.cyan,
                ),
                insets: EdgeInsets.only(top: 20.0,left: 18.0,right: 55.0,),
              ),
              labelColor: Colors.cyan,
              controller: tabController,
            //  labelPadding: EdgeInsets.only(top: 8.0,left: 05.0,right: 05.0),
            //  labelStyle: TextStyle(fontSize: 20.0,),
             // unselectedLabelStyle: TextStyle(fontSize: 10.0,color:Colors.green),
              onTap: (index){
                _currentIndex = index;
                setState(() {
                //  tabControllers();
                  debugPrint('tab controller');
                });
              },
              tabs: <Widget>[
                Container(
                    height:100.0,
                    width: 110.0,
                    child: FittedBox(
                      child: Text('PROFILE',),
                    )),
                Container(
                    height:40.0,
                    width: 135.0,
                    child: FittedBox(child: Text('Features'))),
                Container(
                    height:40.0,
                    width: 130.0,
                    child: FittedBox(child: Text('Invoice Setting',),)),
                Container(
                    height:40.0,
                    width: 120.0,
                    child: FittedBox(child: Text('WebStore'))),
                 ],
              //indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          Container(
            height:240,
            decoration: BoxDecoration(
                color: Colors.white,
//                borderRadius: BorderRadius.only(
//                    topLeft: _currentIndex == 0 ? Radius.circular(00) :Radius.circular(05),
//                    topRight: _currentIndex == 1 ? Radius.circular(00) :Radius.circular(05),
//                    bottomLeft: Radius.circular(05),
//                    bottomRight: Radius.circular(05)
//                )
            ),
            child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: <Widget>[
                 Container(color:Colors.red,child: Text('Tab 1'),),

                  Container(color:Colors.green,child: Text('Tab 2'),),

                  Container(child: Text('Tab 3'),
                  ),
                  Container(color:Colors.red,child: Text('Tab 4'),),

                ]
            ),
          ),

        ],
      ),
    );
  }
}
