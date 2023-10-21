import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0
        ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Image.network(
                  'https://www.alisco-it.com/wp-content/uploads/2022/01/Flutter_Featured_Logo.png',
                  height: 150,
                  width: 200,
                  alignment: Alignment.center,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12.0,bottom: 12.0),
                child: TextFormField(
                  controller: textEditingController,
                  obscureText: false,
                  enabled: true,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? input){
                    if(input == null){
                      return "Email can't be empty";
                    }
                    return null;
                  },
                  onFieldSubmitted: (String input){
                    if (kDebugMode) {
                      print("email is $input");
                    }
                  },
                  decoration: InputDecoration(
                      filled: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      focusedBorder:const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hintText: "Email",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600]
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0,left: 12.0,right: 12.0,bottom: 5.0),
                child: TextFormField(
                  controller: passEditingController,
                  obscureText: true,
                  enabled: true,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  validator: (String? input){
                    if(input == null){
                      return "Password can't be empty";
                    }
                    return null;
                  },
                  onFieldSubmitted: (String input){
                    if (kDebugMode) {
                      print("password is $input");
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder:const OutlineInputBorder(
                      borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: "Password",
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600]
                    ),
                  ),
                ),
              ),
              TextButton(onPressed: (){
                    print("Routing to forgot password page");
                  },
                      child: Text("Forgot Password",style: TextStyle(fontSize: 16),)),
              Container(
                width: 230,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(18),
                  color: Colors.blue,
                ),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  elevation: 0,
                  height: 30,
                  onPressed: (){
                    if (kDebugMode) {
                      print("Route to Logged In page");
                    }
                  },
                  child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                      )
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New User?"),
                    TextButton(onPressed: (){
                      print("Routing to forgot password page");
                    },
                        child: Text("Create Account",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal))),
                  ],
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
