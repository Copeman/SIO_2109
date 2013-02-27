compteMots(ph){
  ph = ph.replaceAll(new RegExp(r'\s{2,}'),' ');
  return ph.split(' ').length;
}

main() {
  var ph = 'Combien    de mots    comportent    cette phrase?';
  print(compteMots(ph));
}