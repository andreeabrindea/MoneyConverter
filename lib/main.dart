import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Money Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double RON = 0;
  String? text;
  String EUR="";
  String? num;

  void onPressed()
  { text = controller.text;

    setState(() {
      if(text!=null){
        RON = double.parse(text!) / 4.93;
        num = RON.toStringAsFixed(2);
        EUR = "$num EUR";
      }
      else {
        RON = 0;
      }

    });
  }
final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        alignment: AlignmentDirectional(0, 8),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$EUR"),
            Image.asset('assets/money.png',
                width: 150,
                height: 200,
                // alignment: AlignmentDirectional(0, -10)
          ),

            TextField(
              controller: controller,
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (String value){
                text = value;

                setState(() {
                });

            },
              decoration: InputDecoration(
                hintText: "Enter the value in RON",
                suffix: IconButton(
                  icon: Icon(Icons.close), onPressed: () { controller.clear(); },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              onPressed: onPressed,
              child: Text(
                "Convert",
              ),
            ),
          ],
        ),
      ), 
    );
  }
}
