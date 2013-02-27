longest(ph) {
  var longest = "";
  for(var i = 0; i < ph.length; i++) {
    longest = ph[i].length>longest.length ? ph[i] : longest; 
  }
  return longest;
}

main(){
  var list = ["Ceci est la première phrase", "Ceci est la deuxième phrase qui est un peu plus longue", "Ceci est la troisième phrase qui est la plus longue de tous par plusieurs charactères", "Ceci est la courte phrase"];
  print(longest(list));
}