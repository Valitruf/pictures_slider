import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Слайдер',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Образец слайдера картинок'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;

  //Список изображений
  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2pyMJwRk1xlvwPOR1TgPrYW4u5O19T8UMGg&usqp=CAU',
    'https://img-fotki.yandex.ru/get/5212/45907829.4d/0_b3bc8_eeb4d1b9_XL.jpg,',
    'https://a.d-cd.net/xqAAAgOFVuA-960.jpg'
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1,viewportFraction: 0.8);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
          controller: pageController,
          itemCount: images.length,
          itemBuilder: (context,position){
            return imageSlider(position);
          })
    );
  }

  imageSlider(int index){
    return AnimatedBuilder(
        animation: pageController,
        builder: (context,widget){
          double value = 1;


          return Center(
            child: SizedBox(
              height: 200,
              width: 300,
              child: widget,
        ),
      );
    },

    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.network(images[index],fit: BoxFit.cover),
    ),
    );
  }
}
