main() {
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
  print(result);
}