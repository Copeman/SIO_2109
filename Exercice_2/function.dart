part of Main;

Exercice_2_1 (ph){
  var longest = "";
  for(var i = 0; i < ph.length; i++) {
    longest = ph[i].length>longest.length ? ph[i] : longest; 
  }
  return longest;
}

Exercice_2_2(ph){
  ph = ph.replaceAll(new RegExp(r'\s{2,}'),' ');
  var word = ph.split(' '),
      longest = '';
  for(var i = 0; i < word.length; i++) {
    longest = word[i].length>longest.length ? word[i] : longest;
  }
  return longest;
}

Exercice_2_3(list){
  //return list[new Math.Random().nextInt(list.length - 1)];
  var random = new Math.Random();
  for (var i = 0; i < list.length; i++) {
    var n = random.nextInt(list.length);
    var temp = list[i];
    list[i] = list[n];
    list[n] = temp;
  }
  return list;
}

Exercice_2_4_1(list) {
  list.sort((a, b) => a[0].compareTo(b[0]));
   return list;
}

Exercice_2_4_2(list, character){
  var newList = new List(),
    split;
  for(var i = 0; i < list.length; i++) {
    split = list[i][0].splitChars()[0];
    if(split == character){
      newList.add(list[i]);
    }
  }
  return newList;
}