import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangement_task/screens/counterProvider.dart';
import 'package:badges/badges.dart' as badges;
class Screen2 extends StatelessWidget {
  final String name;
  final String email;
  final String mobilNumber;
  final String image;


  Screen2({required this.name ,required this.email , required this.mobilNumber,required this.image });

  //const Screen2({Key? key}) : super(key: key);

  @override




  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CounterProvider(),
    child:
        Scaffold(
          backgroundColor: const Color(0xffC2B6A1),
            appBar:AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:
                  Selector<CounterProvider, int>(
                    selector: (context, sel1) => sel1.counter,
                    builder: (context, model, child) {

                      return Center(
                          child:
                          badges.Badge(
                            badgeStyle: badges.BadgeStyle(
                              badgeColor: Color(0xFFA99985),),
                            badgeContent: Text('$model'),
                            badgeAnimation: badges.BadgeAnimation.rotation(
                              animationDuration: Duration(seconds: 1),
                              colorChangeAnimationDuration: Duration(seconds: 1),
                              loopAnimation: false,
                              curve: Curves.fastOutSlowIn,
                              colorChangeAnimationCurve: Curves.easeInCubic,
                            ),
                            child: Icon(Icons.shopping_cart ,color: Color(0xFF2F2E31),size: 30,),
                          )
                      );
                    },
                  ),
                )
              ],
              elevation: 0,
              backgroundColor: const Color(0xffC2B6A1),
              title: Text('Hi, $name' , style: TextStyle(color: Color(0xFF2F2E31),),),
              leading: Padding(
                padding: const EdgeInsets.all(1.0),
                child: ClipOval(
                  child:Image.network(image,fit:BoxFit.cover,)
                ),
              ),
            ),
          body:Center(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    height: 300,
                      width: 300,
                      child: Image.network('https://www.knoll.com/static_resources/images/products/catalog/eco/parts/ISMNERWD/ISMNERWD-OA_FZ.png')),
                  Text('Quantity',style: TextStyle(fontSize: 20 ,   color: Color(0xFF4E4D51),),),
                  SizedBox(height: 10,),
                  Selector<CounterProvider, int>(
                    selector: (context, sel1) => sel1.counter,
                    builder: (context, model, child) {
                      print(model);
                      return Text(
                        '$model',
                        style: TextStyle(
                          fontSize: 48.0,
                          color: Color(0xFF4E4D51),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<CounterProvider>(
                        builder: (context, model, child) {
                          return FloatingActionButton(
                            onPressed: () {
                              model.decrementCounter(); // استدعاء الدالة بدون معاملات
                            },
                            backgroundColor: Color(0xFFA99985),
                            child: Icon(Icons.remove,color: Color(0xFF4E4D51),),
                          );
                        },
                      ),

                      SizedBox(width: 20.0),
                      Consumer<CounterProvider>(
                        builder: (context, model, child) {
                          return  FloatingActionButton(
                            onPressed: () {
                              model.incrementCounter();
                            },
                            backgroundColor: Color(0xFFA99985),
                            child: Icon(Icons.add,color: Color(0xFF4E4D51),),
                          );
                        },
                      ),
                    ],
                  ),

                ],
              ))
        ));
  }
}
