# COBOL Magic Matrix Verifier
This COBOL program, named Matrix, checks whether a given matrix is a "magic matrix" or not. A magic matrix is a square matrix where the sum of each row, each column, and both main diagonals is equal.
# Use 
To use this program, ensure you have a COBOL environment set up. You can compile and execute the program using your preferred COBOL compiler.
# Execution Instructions
1- Execute the program following the compilation and execution instructions of your COBOL environment.
2- Enter the values of the matrix when prompted by the program. Make sure to input integers for each matrix element.
3- The program will verify if the matrix is magic or not and display the corresponding result.
# Operation
1- The program prompts the user to input the values of each matrix element.
2- It then checks if each input is a valid integer. If an input is not valid, the program displays a warning message and prompts for re-entry.
3- Once all matrix values are entered and validated, the program calculates the sum of each row, column, and both main diagonals.
4- Finally, it checks if all sums are equal. If they are, the program displays a message confirming that the matrix is magic. Otherwise, it displays a message indicating that the matrix is not magic.
# Example
***********************
*** Matrice magique ***
***********************
ENTRER LA 01 imme VALEUR 
1
ENTRER LA 02 imme VALEUR 
Z
ENTRER LA 03 imme VALEUR 
A
ENTRER LA 04 imme VALEUR 
2
ENTRER LA 05 imme VALEUR 
4
ENTRER LA 06 imme VALEUR 
5
ENTRER LA 07 imme VALEUR 
6
ENTRER LA 08 imme VALEUR 
7
ENTRER LA 09 imme VALEUR 
8
Attention, nombre non valide !
ENTRER LA 01 imme VALEUR 
11
ENTRER LA 02 imme VALEUR 
21
ENTRER LA 03 imme VALEUR 
23
ENTRER LA 04 imme VALEUR 
45
ENTRER LA 05 imme VALEUR 
43
ENTRER LA 06 imme VALEUR 
21
ENTRER LA 07 imme VALEUR 
11
ENTRER LA 08 imme VALEUR 
11
ENTRER LA 09 imme VALEUR 
11
-----------------------------------
-  C'est pas une matrice magique  -
-----------------------------------
Fin de traitement.

Process finished with exit code 0
