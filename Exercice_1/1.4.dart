import 'dart:math' as Math;

main(){
  num  radians = 1;
  num degrees = radians * (180.0 / Math.PI);
  num degree =  degrees~/1;
  num minute = degrees%1*60~/1;
  num second = degrees%1*60%1*60;
  
  print('$degreeº$minute\'$second"');
}