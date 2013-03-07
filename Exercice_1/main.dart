library Main;
import 'dart:math' as Math;
part 'function.dart';

main() {
  /*
   * Exercice 1.1
   */
  print('Exercice 1.1 :\n');
  int PV = 10000;
  double interest = 0.055;
  int period = 10;
  print(Exercice_1_1(PV, interest, period));
  /*
   * Exercice 1.2
   */
  print('\nExercice 1.2 :\n');
  print(Exercice_1_2());
  /*
   * Exercice 1.3
   */
  print('Exercice 1.3 :\n');
  print(Exercice_1_3());
  /*
   * Exercice 1.4
   */
  print('Exercice 1.4 :\n');
  num  radians = 1;
  print(Exercice_1_4(radians));
  /*
   * Exercice 1.5
   */
  print('\nExercice 1.5 :\n');
  var  sentence = "Écrivez un script qui compte le nombre d'occurrences du caractère « o » dans cette phrase.";
  print(Exercice_1_5(sentence));
  /*
   * Exercice 1.6
   */
  print('\nExercice 1.6 :\n');
  var  palindrome = 'SOS';
  print(Exercice_1_6(palindrome));
  /*
   * Exercice 1.7
   */
  print('\nExercice 1.7 :\n');
  var liste = ['Jean', 'Maximilien', 'Brigitte', 'Sonia', 'Jean-Pierre', 'Sandra'];
  print(Exercice_1_7(liste));
  /*
   * Exercice 1.8
   */
  print('\nExercice 1.8 :\n');
  int n = 75;
  print(Exercice_1_8(n));
  /*
   * Exercice 1.9
   */
  print('\nExercice 1.9 :');
  var liste2 = ['Jean-Michel', 'Marc', 'Vanessa', 'Anne', 'Maximilien', 'Alexandre-Benoît', 'Louise'];
  print(Exercice_1_9(liste2));
  /*
   * Exercice 1.10
   */
  print('\nExercice 1.10 :\n');
  var ph = 'Combien    de mots    comportent    cette phrase?';
  print(Exercice_1_10(ph));
}


