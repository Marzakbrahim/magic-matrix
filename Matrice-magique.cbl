       IDENTIFICATION DIVISION.
       PROGRAM-ID. Matrix.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

      * Les entrées de l'utilisateurs :
       01 MATRICE.
           05 MAT OCCURS 9 PIC X(3).

      * indice pour parcourir la matrice :
       01 I PIC 9(2).
       01 J PIC 9(2).
      * La taille de la matrice :
       01 TAILLE PIC 9(2).


      * Le nombre de composants  :
       01 NB-COMP PIC 9(4).

      * La structure de la matrice qui permet de faire le calcul :
       01 Tab-Matrix.
           05 Ligne                 OCCURS 3 INDEXED BY IND-Ligne.
             10 Colonne             OCCURS 3 INDEXED BY IND-col.
               15 Valeur            PIC 9(3).

      * 8 DANS Sommes est calculée comme suivant :  Taille-somme = 2 * TAILLE  + 2
       01 Sommes.
           05 Sm   OCCURS 8 PIC 9(4).


      * variable pour stocker la somme des indicies
       01 SOMME-INDICES                        PIC 9(2).


      * boléan pour savoir si c'est magique ou pas :
       01 Magique  PIC X.
           88 Magique-Oui  VALUE 'Y'.
           88 Magique-Non  VALUE 'N'.

      * variable intermidaire pour mettre l'entre de l'utilisateur :
      * 01 Test-string PIC X(10) VALUE "  HIM".
       01 interm PIC 9(3).



       PROCEDURE DIVISION.

      *********************
       PROGRAMME-PRINCIPAL.
      *********************
      * L'intéligence général du programme.
           PERFORM INITIALISATION-DEB THRU INITIALISATION-FIN
           PERFORM TRAITEMENTS-DEB THRU TRAITEMENTS-FIN
           PERFORM FIN
           .


      ********************
       INITIALISATION-DEB.
      ********************
           INITIALISE Tab-Matrix
                      SOMME-INDICES
                      I
                      J
                      interm
                      MATRICE
           MOVE 3 TO TAILLE
           COMPUTE NB-COMP = TAILLE * TAILLE
           SET Magique-Oui TO TRUE

           DISPLAY '***********************'
           DISPLAY '*** Matrice magique ***'
           DISPLAY '***********************'
      *     DISPLAY "mon test string : '" FUNCTION TRIM(Test-string) "'"
           .
      **************************
       INITIALISATION-FIN. EXIT.
      **************************

      ***************
       CONTROLES-DEB.
      ***************
      *>      IF MATRICE IS NOT NUMERIC
      *>        DISPLAY "Attention, vous n'avez pas entre un nombre !"
      *>        PERFORM TRAITEMENTS-DEB THRU TRAITEMENTS-FIN
      *>      END-IF
      *>      .
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NB-COMP
               IF FUNCTION TRIM(MAT(I)) NOT NUMERIC
                 DISPLAY "Attention, nombre non valide !"
                 PERFORM TRAITEMENTS-DEB THRU TRAITEMENTS-FIN
               END-IF
           END-PERFORM
           .
      *********************
       CONTROLES-FIN. EXIT.
      *********************


      *****************
       TRAITEMENTS-DEB.
      *****************
           PERFORM RecevoirMatrix THRU FIN-RecevoirMatrix
           PERFORM CONTROLES-DEB THRU CONTROLES-FIN
           PERFORM Calcule THRU FIN-Calcule

           .
      ************************
       TRAITEMENTS-FIN. EXIT.
      ************************



      *------------------------------------------------------------------------
      **************
       RecevoirMatrix.
      **************
           MOVE 9 TO NB-COMP
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NB-COMP
             DISPLAY "ENTRER LA " I " imme VALEUR "
             ACCEPT MAT(I)
           END-PERFORM

           .
      ******************
       FIN-RecevoirMatrix. EXIT.
      ******************

      *------------------------------------------------------------------------


      ***********
       Calcule.
      ***********
      *    Remplissage du tableau :
      *     MOVE Matrix TO Tab-Matrix
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NB-COMP
               MOVE FUNCTION  TRIM(MAT(I)) TO interm
               MOVE interm TO MAT(I)
      *         DISPLAY I "ime composant de la matrice : '"MAT(I) "'"
           END-PERFORM
           MOVE MATRICE TO Tab-Matrix



      ************************* Calcule : *************************************

      * LES LIGNES :
           PERFORM VARYING IND-ligne FROM 1 BY 1
                                               UNTIL IND-ligne > TAILLE
             PERFORM VARYING IND-Col FROM 1 BY 1
                                               UNTIL IND-Col > TAILLE
               ADD Valeur(IND-ligne IND-Col) TO Sm(IND-ligne)
             END-PERFORM
      *       DISPLAY "somme de la ligne " IND-ligne " est "
      *                                                   Sm(IND-ligne)
           END-PERFORM


      ** LES colonnes :
           PERFORM VARYING IND-Col FROM 1 BY 1
                                               UNTIL IND-Col > TAILLE
             PERFORM VARYING IND-ligne FROM 1 BY 1
                                               UNTIL IND-ligne > TAILLE
                 ADD Valeur(IND-ligne IND-Col) TO Sm(IND-Col + TAILLE)
             END-PERFORM
      *       DISPLAY "somme de la colonne " IND-col " est "
      *                                      Sm(IND-Col + TAILLE)
           END-PERFORM



      * LA DIAGONALE :
           PERFORM VARYING IND-Col FROM 1 BY 1
                                               UNTIL IND-Col > TAILLE
                 ADD Valeur(IND-col IND-Col) TO Sm(2 * TAILLE + 1)
           END-PERFORM
      *     DISPLAY "somme Diagonale 2 : " Sm( 2 * TAILLE + 1 )

      * La diagonale 2 :
           PERFORM VARYING IND-ligne FROM 1 BY 1 UNTIL IND-ligne > 3
             PERFORM VARYING IND-col FROM 1 BY 1 UNTIL IND-col > 3
               COMPUTE SOMME-INDICES = IND-ligne + IND-col
               IF SOMME-INDICES = 4
                 ADD Valeur(IND-ligne IND-col)
                                         TO Sm( 2 * TAILLE + 2 )
               END-IF
             END-PERFORM
           END-PERFORM
      *     DISPLAY "somme Diagonale 2 : " Sm( 2 * TAILLE + 2 )

           PERFORM VARYING I FROM 1 BY 1 UNTIL I = 8
             IF Sm(I) NOT = Sm(I + 1)
               SET Magique-Non TO TRUE
             END-IF
           END-PERFORM


           IF Magique-Oui
             DISPLAY "-------------------------------"
             DISPLAY "-  Yes, Matrice magique !!!!  -"
             DISPLAY "-------------------------------"
           ELSE
               DISPLAY "-----------------------------------"
               DISPLAY "-  C'est pas une matrice magique  -"
               DISPLAY "-----------------------------------"
           END-IF


           .
      ***************
       FIN-Calcule. EXIT.
      ***************


      ******
       FIN.
      ******
           DISPLAY 'Fin de traitement.'
           STOP RUN.
       END PROGRAM Matrix.
