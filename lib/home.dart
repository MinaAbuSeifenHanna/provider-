
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providor.dart';
import 'manger.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}


class _MyHomeState extends State<MyHome> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context, listen:  false);
    return  Scaffold(
      backgroundColor: Colors.black87,
      appBar:  AppBar(
        title: Text( Manger.name,
        style: Manger.style,
        ),
        backgroundColor: Colors.black,
      ),
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Selector<AppProvider,String>(
              selector: (context, AppProvider ) => AppProvider.img ,
              builder:
                  (context, value, _)
              {
              return
                CircleAvatar(
                  backgroundImage: AssetImage(value,),
                  radius: 100,
                );

              },
            ),
            Selector<AppProvider,DateTime>(
              selector: (context, prov ) => prov.time ,
              builder:
                  (context, value, _)
              {
                return
                  Text(value.toString(),
                    style:Manger.style
                  );

              },
            ),
            Selector<AppProvider,int>(
              selector: (context, prov ) => prov.count ,
              builder:
                  (context, value, _)
              {
                print('rebuild selector 3');
                return
                  Text('Count $value',
                    style:Manger.style,
                  );

              },
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: provider.incrementCount,
            child:  const Icon(Icons.add),),
          FloatingActionButton(
            onPressed: provider.decrementCount ,
            child: const Icon(Icons.remove),),
          FloatingActionButton(
            onPressed: (){

              provider.changeDataTime();
              provider.changeImage();
              provider.defaultCount();
            },
            child:  const Icon(Icons.refresh),),
          FloatingActionButton(
            onPressed: provider.changeDataTime,
            child:  const Icon(Icons.edit),),
          FloatingActionButton(
            onPressed: provider.changeImage,
            child: const  Icon(Icons.photo),),

        ],
      ),

    );
  }
}