main() {
  var liste = ['Jean', 'Maximilien', 'Brigitte', 'Sonia', 'Jean-Pierre', 'Sandra'];
  var petiteliste = new List();
  var grandeliste = new List();
  
  liste.forEach((nom){
    if(nom.length >= 6) {
      grandeliste.add(nom);
    } else {
      petiteliste.add(nom);
    }
  });
  
  print("Petite liste : $petiteliste \nGrande liste : $grandeliste");
}

