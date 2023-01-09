import 'package:flutter/material.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:scrolltospecificlocation/textfield_floating_action_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Scroll Position',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

 enum MyColors {
   red,
   orange,
   yellow,
   green,
   blue,
   indigo,
   violet
}

final allItems = [
  1,
  2,
  3,
  4,
  5,6,7,8,9,10,11,12,13,14,16,17,18,19,20,21,22,23
];


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ItemScrollController _scrollController = ItemScrollController();

  int indexPosition = 0;
  bool isUpArrow = false;

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollablePositionedList.builder(
          itemScrollController: _scrollController,
          itemCount: allItems.length,
          itemBuilder: ((context, index) {
          return  ListTile(
            title: Text(allItems[index].toString()),
          );
        }



        ),
        ),
    
        
        ),
        floatingActionButton: Stack(
          children: [

            Align(
              alignment: Alignment.bottomCenter,
              child: TextFieldFloatingActionButton(
                backgroundColor: Colors.blue,
                iconColor: Colors.black,
                onSubmit: (v){},
                  'Search...',
                  Icons.gamepad,
                  onChange: (String query){  
                    if(query.isNotEmpty && int.tryParse(query)!=null){
                      _scrollController.scrollTo(index: int.parse(query), duration: const Duration(seconds: 1));
                    }
                    
                  },
                  onClear: () => _scrollController.scrollTo(index: indexPosition, duration: const Duration(seconds: 1)),
              ),
            ),
    //         Align(
    //   alignment: Alignment.bottomCenter,
    //   child: FloatingActionButton(
    //     onPressed: (){},
    //     child: const Text('J'),
    //   ),
    // ),
            Align(
               alignment: Alignment.bottomRight,
              child: FloatingActionButton(
              onPressed: (){
              isUpArrow = !isUpArrow;
              isUpArrow? indexPosition = allItems.length:indexPosition=0;
              setState(() {
                
              });
              _scrollController.scrollTo(index: indexPosition, duration: const Duration(seconds: 1),
              
              );
              
                      },
                    
                      backgroundColor: Colors.green,
                      child:  Icon(isUpArrow? Icons.arrow_upward: Icons.arrow_downward),
                      
                      
                      ),
            )
          ],
      
        ),


    );
  }
}


 