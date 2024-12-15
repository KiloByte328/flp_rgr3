goool:- writeln("Choose one option:"),
writeln("Get info for one student - 1"),
writeln("Get what students are will be discvalificated - 2"),
writeln("Get all students info - 3"),
writeln("Add to db - 4"),
writeln("Delete student and his info - 5"),
read(F),
F == 1, db_get_info(), goool();
F == 2, db_get_stats(), goool();
F == 3, db_get_all_info(), goool();
F == 4, db_add(), goool();
F == 5, db_delete(), goool(); writeln("exit because cant recognize command"), !.

db_get_info:- open('db', read, F1), writeln("Enter student name you want to get info"), read(Name),
finder(F1, Name, Pos, NStr), writeln(NStr), writeln(Pos), !; writeln("this student isnt in database"), close(F1), !.

db_get_stats:- open('db', read, F1).

db_get_all_info:- open('db', read, F1).

db_add:- writeln("Enter new student name:"),
read(Name), writeln("Enter marks of 4 disciplines, in range of 2 to 5:"),
read(Fst), read(Scnd), read(Thrd), read(Frth), open(X, append, F2),
write(F2, Name), write(F2, Fst), write(F2, Scnd), write(F2, Thrd), write(F2, Frth), !.

db_delete:- open('db', read, F1), writeln("Enter student name you want to delete"),read(Name),
finder(F1, Name, Pos, NStr), Pos == -1,close(F1), finder_two(F1, Name, _, Nstr),
open('db', write, F1), writer(F1, NStr), !; writeln("this student isnt in database"), close(F1), !.

finder(F, Str, Pos, [N|T]):- read_string(F, _, N), sub_string(N, D, X, _, Str),
Pos = X, N = T, !; finder(F, Str, Pos1, T), Pos is Pos1 + 1;fail.

finder_two(F, Str, Pos, N):- read_string(F, _, N), sub_string(N, D, _, _, Str),
Pos = 1, !; finder_two(F, Str, Pos1, N), Pos is Pos1 + 1;fail.

reader(F, N):- repeat, get_char(F, N).

writer(F, [N|T]):- write(F, N), writer(F, T).
writer(_, []).

reader(F, E):-.
