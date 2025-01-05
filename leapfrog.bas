
50 rem set up the initial layout
100 dim a$(9)
105 for a= 1 to 4
106 let a$(a)="x"
107 next a
108 let a$(5)=" "
109 for a= 6 to 9
110 let a$(a)="o"
111 next a
112 let move = 1
113 GOSUB 5000
114 LET X=35:LET Y=5
115 co=x:ro=y:gosub 5020
120 A1=1:A2=37:A3=40:GOSUB 5090:PRINT "LEAPFROG!";
121 GOSUB 5140:PRINT
125 co=x+3:ro=30:gosub 5020
126 print "Rules"
127 co=x-15:ro=31:gosub 5020
128 print "move all the x's to occupy the o's position"
129 co=x-15:ro=32:gosub 5020
130 print "move all the o's to occupy the x's position"
131 co=x-17:ro=33:gosub 5020
132 print "you can only move to an adjacent empty space or"
133 co=x-4:ro=34:gosub 5020
134 print "leapfrog 1 character"
140 CO=x-4:RO=y+5:GOSUB 5020
141 print a$(1);" ";a$(2);" ";a$(3);" ";a$(4);" ";a$(5);" ";a$(6);
142 print " ";a$(7);" ";a$(8);" ";a$(9):ro=11:gosub 5020
143 print "1 2 3 4 5 6 7 8 9"
144 rem determine x or o move
145 if move/2<> int(move/2) then m$="x"
146 if move/2= int(move/2) then m$="o"
148 co=x-3:ro=15:gosub 5020
149 print m$;"'s turn to move"
150 co=x-9:ro=16:gosub 5020
151 input "move position start number";a$
152 let a=asc(a$)
153 if a<=48 or a>=58 then goto 900
154 let a=a-48
159 co=x-7:ro=17:gosub 5020
160 input "position finish number";b$
161 let b=asc(b$)
162 if b<=48 or b>=58 then goto 900
163 let b=b-48

164 co=x-1:ro=19:gosub 5020
165 print "move number ";move
170 rem test input for legitamacy.
171 rem if the move number is an even number then it's o's turn
172 rem and the the first number must be lower than the second
173 rem it is the opposite for the x moves where b must be higher
180 if m$="x" and b-a>2 then goto 900
185 if m$="o" and b-a>2 then goto 900
190 if m$="x" and a-b>2 then goto 900
195 if m$="o"and a-b>2 then goto 900
700 rem move routine
710 if m$="x" then gosub 950
720 if m$="o" then gosub 1050
798 let move =move+1
799 goto 140
900 rem illegal move 
909 co=x-5:ro=25:gosub 5020
910 print "This is an illegal move."
919 co=x-3:ro=26:gosub 5020
920 print "see the rules below."
925 for z=1 to 4000:next z
929 co=x-5:ro=25:gosub 5020
930 print "                        "
939 co=x-3:ro=26:gosub 5020
940 print "                    "
945 goto 140
950 rem x test move 
960 if a$(a) <> "x" goto 900
970 if a$(b) <>" " goto 900
980 let a$(a)=" "
990 let a$(b)="x"
995 gosub 1200
1000 return
1050 rem o test move
1060 if a$(a) <> "o" goto 900
1070 if a$(b) <>" " goto 900
1080 let a$(a)=" "
1090 let a$(b)="o"
1095 gosub 1200
1100 return
1200 rem test for finish
1220 if a$(1)<>"o" then return
1230 if a$(2)<>"o" then return
1240 if a$(3)<>"o" then return
1250 if a$(4)<>"o" then return
1260 if a$(5)<>" " then return
1270 if a$(6)<>"x" then return
1280 if a$(7)<>"x" then return
1290 if a$(8)<>"x" then return
1300 if a$(9)<>"x" then return
1400 rem completed!
1405 gosub 5000
1408 co=28:ro=20:gosub 5020
1410 A1=1:A2=37:A3=40:GOSUB 5090:print "Completed!";:gosub 5140:print
1415 co=24:ro=21:gosub 5020: print "It took ";move;" moves"
1417 co=0:ro=40:gosub 5020
1420 stop

4999 rem screen manipulation to print at locations
5000 REM CLEAR SCREEN                   
5010 PRINT CHR$(27);"[2J": RETURN       
5020 REM Set cursor pos ro=row, co=col
5030 RO$=STR$(RO):RO$=RIGHT$(RO$,LEN(RO$)-1)
5040 CO$=STR$(CO):CO$=RIGHT$(CO$,LEN(CO$)-1)
5050 PRINT CHR$(27)+"["+RO$+";"+CO$+"H";
5070 RETURN
5080 REM SET ATTRIBUTES A1=attribute, A2=Foreground color, A3=Background
5090 A1$=STR$(A1):A1$=RIGHT$(A1$,LEN(A1$)-1)
5100 A2$=STR$(A2):A2$=RIGHT$(A2$,LEN(A2$)-1)
5110 A3$=STR$(A3):A3$=RIGHT$(A3$,LEN(A3$)-1)
5120 X$=CHR$(27)+"["+A1$+";"+A2$+";"+A3$+"m":PRINT X$;:RETURN
5130 REM RESET ATTRIBUTES
5140 X$=CHR$(27)+"[0m":PRINT X$;:RETURN


