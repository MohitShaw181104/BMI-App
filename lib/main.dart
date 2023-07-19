import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 117, 58, 218)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController();
  var inController = TextEditingController();
  var ftController = TextEditingController();

  var result="";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('BMI', style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w700
              ),),
          
              const SizedBox(height: 21,),
          
          
              TextField(
                controller: wtController,
                decoration: const InputDecoration(
                  label: Text('Enter Your Weight(kgs)'),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
          
              const SizedBox(height: 11,),
          
          
              TextField(
                controller: ftController,
                decoration: const InputDecoration(
                  label: Text('Enter Your Height(ft)'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
          
              const SizedBox(height: 11,),
          
              TextField(
                controller: inController,
                decoration: const InputDecoration(
                  label: Text('Enter Your Height(inch)'),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
      
              const SizedBox(height: 20,),
      
              ElevatedButton(onPressed:(){
      
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();
      
                if(wt!="" && ft!="" && inch!=""){
      
                  //BMI CALCULATION
      
                  var iWt = int.parse(wt);
                  var iFt = int.parse(ft);
                  var iInch = int.parse(inch);
      
                  var tInch = (iFt*12) + iInch;
      
                  var tCm = tInch*2.54;
      
                  var tM = tCm/100;
      
                  var bmi = iWt/(tM*tM);

                  var msg= "";

                  if(bmi>25){
                    msg= "You Are OverWeight!!";
                    bgColor = Colors.orange.shade200;

                  }else if(bmi<18){
                    msg= "You Are UnderWeight!!";
                    bgColor = Colors.red.shade200;

                  }else{
                    msg= "You Are Healthy!!";
                    bgColor = Colors.green.shade200;
                  }
      
                  setState(() {
                    result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(1)}";
                  });
      
                  
      
                }else {
                  setState(() {

                    result = "Please fill all the required blanks!! ;)";
                  });
                }
      
      
              },child: const Text('Calculate'),),
      
              const SizedBox(height: 11,),
      
      
              Text(result, style: const TextStyle(fontSize: 20),)
      
      
      
          
            ],),
          ),
        ),
      )


    );
  }
}
