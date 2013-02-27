main(){
  
  var clubs = new List();
  //Ajout
  clubs.add(new Map.from({"nom" : "Club des retraitées"}));
  clubs.add(new Map.from({"nom" : "Erreur"}));
  //Supression
  clubs.remove(clubs[1]);
  
  var membres = new List();
  //Ajout
  membres.add(new Map.from({"nom" : "Paré", "prenom" : "Pierre", "email" : "pierre.pare@gmail.com"}));
  membres.add(new Map.from({"nom" : "Boivin", "prenom" : "Cynthia", "email" : null}));
  //Modification
  membres[1]['email'] = "cynthia.boivin@gmail.com";
  
  //Affichage
  print("Clubs : $clubs \nMembres : $membres");
}