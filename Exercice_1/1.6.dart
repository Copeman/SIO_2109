is_palindrome(String characters){
  var inverted = '',
      list = characters.splitChars();
  int len = characters.length;
  
  for(var i = 0; i < len; i++) {
    inverted = '$inverted${list[len-i-1]}';
  }
  
  return characters==inverted ? true : false ;
}

main() {
  print(is_palindrome('SOS'));
}