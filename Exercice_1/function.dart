part of Main;

Exercice_1_1 (num PV, num interest, num period){
  return PV * Math.pow((1 + interest), period);
}

Exercice_1_2 () {
  var result = "";
  num product;
  for(int i = 1; i <= 100; i++) {
    product = i * 14;
    result = '$result$product\n';
  }
  return result;
}

Exercice_1_3() {
  var result = "";
  for(int i = 0; i<9; i=i+2) {
    for(int j = 1; j < 9-i; j++) {
      result = '$result ';
    }
    for(int k = 1; k < i+2; k++) {
      result = '$result*';
    }
    result = '$result\n';
  }
  return result;
}

Exercice_1_4(num radians){
  num degrees = radians * (180.0 / Math.PI);
  num degree =  degrees~/1;
  num minute = degrees%1*60~/1;
  num second = degrees%1*60%1*60;
  
  return '$degreeº$minute\'$second"';
}

Exercice_1_5(String sentence){
  return sentence.split("o").length-1;
}

Exercice_1_6(String characters){
  var inverted = '',
      list = characters.splitChars();
  int len = characters.length;
  
  for(var i = 0; i < len; i++) {
    inverted = '$inverted${list[len-i-1]}';
  }
  
  return characters==inverted ? true : false ;
}

Exercice_1_7(var liste){
  var petiteliste = new List();
  var grandeliste = new List();
  
  liste.forEach((nom){
    if(nom.length >= 6) {
      grandeliste.add(nom);
    } else {
      petiteliste.add(nom);
    }
  });
  
  return "Petite liste : $petiteliste \nGrande liste : $grandeliste";
}

Exercice_1_8(num note){
  return (note >= 90) ? 'A' : (note >= 80) ? 'B' : (note >= 70) ? 'C' : (note >= 60) ? 'D' : 'e';
}

Exercice_1_9(var liste){
  var result = "";
  for(var i = 0; i < liste.length; i++) {
    result = '$result\n${liste[i]} (${liste[i].length})';
  }
  return result;
}

Exercice_1_10(String ph){
  ph = ph.replaceAll(new RegExp(r'\s{2,}'),' ');
  return ph.split(' ').length;
}