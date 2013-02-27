order(list) {
  list.sort((a, b) => a[0].compareTo(b[0]));
   return list;
}

search(list, character){
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

main() {
  var members = [
      ['St-Pierre', 'George', 'george.st-pierre@gmail.com'],
      ['Silva', 'Anderson', 'anderson.silva@gmail.com'],
      ['Jones', 'jon', 'jon.jones@gmail.com']
    ];
  var membersOrdered = order(members);
  var membersSearch = search(members, 'S');
}


