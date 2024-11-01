import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.gender, required this.age, required this.mbiResult, required this.mbiStatus});
  String gender, mbiStatus;
  double mbiResult, age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back,color: Colors.white,)
        ),
        backgroundColor: const Color(0xff191D20),
      ),
      body: Container(
        color: const Color(0xff191D20),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Expanded(
              flex: 2,
                child: Text("Your BMI Result",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),)),
            Expanded(flex: 10,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff272A2F),//#272A2F
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(mbiStatus, style: const TextStyle(color: Color(0xffEFA931), fontSize: 20, fontWeight: FontWeight.w500),),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(mbiResult.toStringAsFixed(2), style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                      ),
                      Text(mbiStatus=="Normal"?"Good job":"Please take care yourself", style: TextStyle(color: mbiStatus=="Normal"? Colors.greenAccent:Colors.red, fontSize: 15))
                    ],
                  ),

                )),
            Expanded(
              flex: 2,
                child: Container(alignment: Alignment.center,
                  child: Text("Thank You $gender, Your age is: $age", style: const TextStyle(color: Colors.tealAccent),),
                ))
          ],
        ),
      ),
    );
  }
}
