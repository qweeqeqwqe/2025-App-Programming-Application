import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { MAN, WOMEN }

class _MyHomePageState extends State<MyHomePage> {
  //bool? _isChecked1 = false;
  //bool _isChecked2 = false;
  //Gender _gender = Gender.MAN;
  final _valueList = ['첫 번째', '두 번째', '세 번째'];
  String? _selectedValue = '첫 번째';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Checkbox(
      //           value: _isChecked1,
      //           onChanged: (value) {
      //             setState(() {
      //               _isChecked1 = value;
      //             });
      //           },
      //         ),
      //         SizedBox(
      //           height: 40,
      //         ),
      //         Switch(
      //           value: _isChecked2,
      //           onChanged: (value) {
      //             setState(() {
      //               _isChecked2 = value;
      //             });
      //           },
      //         )
      //       ],
      //     )
      //   )
      // ),
      //   body: Column(
      //       children: [
      //   ListTile(
      //   title: Text('남자'),
      //   leading: Radio(
      //     value: Gender.MAN,
      //     groupValue: _gender,
      //     onChanged: (value) {
      //       setState(() {
      //         _gender = value;
      //       });
      //     },
      //   ),
      // ),
      // ListTile(
      // title: Text('여자'),
      // leading: Radio(
      // value: Gender.WOMEN,
      // groupValue: _gender,
      // onChanged: (value){
      // setState(() {
      // _gender = value;
      // });
      // },
      // ),
      // ),
      // SizedBox(height: 40),
      // RadioListTile(
      // title: Text('남자'),
      // value: Gender.MAN,
      // groupValue: _gender,
      // onChanged: (value){
      // setState(() {
      // _gender = value;
      // });
      // },
      // ),
      // SizedBox(height: 40),
      // RadioListTile(
      // title: Text('여자'),
      // value: Gender.WOMEN,
      // groupValue: _gender,
      // onChanged: (value){
      // setState(() {
      // _gender = value;
      // });
      // }
      // )
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: _selectedValue,
              items:
                  _valueList.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            DropdownButton(
              value: _selectedValue,
              items:
                  _valueList.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
