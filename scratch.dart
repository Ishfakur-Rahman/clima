import 'dart:io';

void main(){
  performTask();
}

void performTask() async{
  task1();
  // String task2Data= await task2();
  task3(await task2());//can be done these two methods
}

void task1(){
  String result = 'Task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async{
  Duration someSeconds=Duration(seconds: 3);
  String result = 'null';
  await Future.delayed(someSeconds, (){
    result = 'Task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task2Data){
  String result = 'Task 3 data';
  print('Task 3 complete! Now its $task2Data');
}