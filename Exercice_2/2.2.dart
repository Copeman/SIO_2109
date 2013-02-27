longestWord(ph){
  ph = ph.replaceAll(new RegExp(r'\s{2,}'),' ');
  var word = ph.split(' '),
      longest = '';
  for(var i = 0; i < word.length; i++) {
    longest = word[i].length>longest.length ? word[i] : longest;
  }
  return longest;
}

main() {
  var ph = 'Quel est le mot le plus long de cette phrase avec des mots incroyablement long?';
  print(longestWord(ph));
}