library Main;
import 'dart:math' as Math;
part 'function.dart';

main() {
  /*
   * Exercice 2.1
   */
  print('Exercice 2.1 :\n');
  var list = ["Ceci est la première phrase",
              "Ceci est la deuxième phrase qui est un peu plus longue",
              "Ceci est la troisième phrase qui est la plus longue de tous par plusieurs charactères",
              "Ceci est la courte phrase"];
  print(Exercice_2_1(list));
  
  /*
   * Exercice 2.2
   */
  print('\nExercice 2.2 :\n');
  var ph = 'Quel est le mot le plus long de cette phrase avec des mots incroyablement long?';
  print(Exercice_2_2(ph));
  
  /*
   * Exercice 2.3
   */
  print('\nExercice 2.3 :\n');
  var list2 = ['Jean-Michel', 'Marc', 'Vanessa', 'Anne', 'Maximilien', 'Alexandre-Benoît', 'Louise'];
  print(Exercice_2_3(list2));
  
  
  /*
   * Exercice 2.4
   */
  var membres = [
                 ['St-Pierre', 'George', 'george.st-pierre@gmail.com'],
                 ['Silva', 'Anderson', 'anderson.silva@gmail.com'],
                 ['Jones', 'jon', 'jon.jones@gmail.com']
                 ];
  print('\nExercice 2.4.1 :\n');
  print(Exercice_2_4_1(membres));
  print('\nExercice 2.4.2 :\n');
  print(Exercice_2_4_2(membres, 'S'));
  
  
  
  
  
  /*
   * Exercice 2.5
   */
  print('\nExercice 2.5 :\n');
  var clubs = new List();
  //Ajout
  clubs.add(new Map.from({"nom" : "Club des retraitées"}));
  clubs.add(new Map.from({"nom" : "Erreur"}));
  //Supression
  clubs.remove(clubs[1]);
  
  var membres2 = new List();
  //Ajout
  membres2.add(new Map.from({"nom" : "Paré", "prenom" : "Pierre", "email" : "pierre.pare@gmail.com"}));
  membres2.add(new Map.from({"nom" : "Boivin", "prenom" : "Cynthia", "email" : null}));
  //Modification
  membres2[1]['email'] = "cynthia.boivin@gmail.com";
  
  //Affichage
  print("Clubs : $clubs \nMembres : $membres2");
}

