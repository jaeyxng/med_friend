import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('약사친구'),

          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text("약사친구"),
              ),
              Center(
                child: Text("지도"),
              ),
              Center(
                child: Text("apps"),
              ),
              Center(
                child: Text("설정"),
              ),
            ],
          ),
          extendBodyBehindAppBar: true, // add this line
          
          bottomNavigationBar: Container(
            color: Colors.white, //색상
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              child: const TabBar(
                //tab 하단 indicator size -> .label = label의 길이
                //tab 하단 indicator size -> .tab = tab의 길이
                indicatorSize: TabBarIndicatorSize.label,
                //tab 하단 indicator color
                indicatorColor: Colors.red,
                //tab 하단 indicator weight
                indicatorWeight: 2,
                //label color
                labelColor: Colors.red,
                //unselected label color
                unselectedLabelColor: Colors.black38,
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    text: '약사친구',
                  ),
                  Tab(
                    icon: Icon(Icons.map_outlined),
                    text: '지도',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.apps,
                    ),
                    text: 'Apps',
                  ),
                  Tab(
                    icon: Icon(
                      Icons.settings,
                    ),
                    text: '설정',
                  )
                ],
              ),
            ),
          ),
      ), 
    );
  }
}