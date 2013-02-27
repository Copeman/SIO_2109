main () {
  int n = 75;
  print(NoteStandardisee(n));  
}

NoteStandardisee (int note) {
  return (note >= 90) ? 'A' : (note >= 80) ? 'B' : (note >= 70) ? 'C' : (note >= 60) ? 'D' : 'e';
}