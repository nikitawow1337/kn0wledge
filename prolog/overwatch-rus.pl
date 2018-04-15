% Expert system should be started from here
main :-
  intro,
  reset_answers,
  find_hero(Language),
  describe(Language), nl.


intro :-
  write('������ ��������� ��� ������� � ���� Overwatch?'), nl,
  write('����� ��������, ������� �����, ������� ����� � �������, �� �������� ��������� ����� (.)'), nl, nl.


find_hero(Language) :-
  hero(Language), !.


% Store user answers to be able to track his progress
:- dynamic(progress/2).


% Clear stored user progress
% reset_answers must always return true; because retract can return either true
% or false, we fail the first and succeed with the second.
reset_answers :-
  retract(progress(_, _)),
  fail.
reset_answers.


% Rules for the knowledge base
hero(pharah) :-
  role(offense),
  diff(easy),
  vertical(yes).
 
hero(reaper) :-
  role(offense),
  diff(easy),
  vertical(no),
  sdistance(short).

hero(soldier76) :-
  role(offense),
  diff(easy),
  vertical(no),
  sdistance(average).

hero(mccree) :-
  role(offense),
  diff(mid),
  teamup(yes).

hero(tracer) :-
  role(offense),
  diff(mid),
  teamup(no).

hero(sombra) :-
  role(offense),
  diff(hard),
  invis(yes).

hero(doomfist) :-
  role(offense),
  diff(hard),
  invis(no),
  procast(yes).

hero(genji) :-
  role(offense),
  diff(hard),
  invis(no),
  procast(no).
  
hero(bastion) :-
  role(defence),
  diff(easy),
  
hero(widow) :-
  role(defence),
  diff(mid),
  snipe(yes).

hero(junkrat) :-
  role(defence),
  diff(mid),
  snipe(no),
  grenade(yes).
  
hero(torbjorn) :-
  role(defence),
  diff(mid),
  snipe(no),
  grenade(no).
  
hero(hanzo) :-
  role(defence),
  diff(hard),
  bow(yes).
  
hero(mei) :-
  role(defence),
  diff(hard),
  bow(no).
  
hero(roadhog) :-
  role(tank),
  diff(easy),
  hook(yes).
  
hero(reinhardt) :-
  role(tank),
  diff(easy),
  hook(no).
  
hero(winston) :-
  role(tank),
  diff(mid),
  damage(no).
  
hero(dva) :-
  role(tank),
  diff(mid),
  damage(yes),
  ddistance(prshort).
  
hero(orisa) :-
  role(tank),
  diff(mid),
  damage(yes),
  ddistance(any).
  
hero(zarya) :-
  role(tank),
  diff(hard).

hero(brigitte) :-
  role(support),
  diff(easy),
  block(yes).

hero(mercy) :-
  role(support),
  diff(easy),
  block(no).

hero(lucio) :-
  role(support),
  diff(mid),
  speedtp(speed).
  
hero(moira) :-
  role(support),
  diff(mid),
  speedtp(tp),
  heal(yes).
  
hero(symmetra) :-
  role(support),
  diff(mid),
  speedtp(tp),
  heal(no).
  
hero(zenyatta) :-
  role(support),
  diff(hard),
  ddamage(yes).
  
hero(ana) :-
  role(support),
  diff(hard),
  ddamage(no).

% Questions for the knowledge base
question(role) :-
  write('����� ���� �������� ��� ������ �����?'), nl.

question(diff) :-
  write('��������� ������� ����� ��������� ����?'), nl.
  
question(vertical) :-
  write('������������� �� ������������ �����������?'), nl.

question(sdistance) :-
  write('�������� �� ����� ��������� �������������?'), nl.

question(teamup) :-
  write('������ �� ��� ����� ��������� � ��������?'), nl.

question(invis) :-
  write('������ �� ������������ �����������?'), nl.

question(procast) :-
  write('���������� �� ������������ �������?'), nl.

question(snipe) :-
  write('������ ���� ���������?'), nl.

question(grenade) :-
  write('������ ������������ ���������?'), nl.

question(bow) :-
  write('������ �������� �� ����?'), nl.

question(hook) :-
  write('������ �� ����������� ����������� � ���� ��� ������ ����?'), nl.

question(damage) :-
  write('���������� �� ����� ������������ ����� ��� � �������� ���?'), nl.
  
question(ddistance) :-
  write('����� ���������� ��� ��������� ����� �����������?'), nl.
  
question(block) :-
  write('���������� �� � �������� �������������� ���� ������������ �����?'), nl.
  
question(speedtp) :-
  write('������ �������� ��� ������������?'), nl.
  
question(heal) :-
  write('����������� �� �������� ���������?'), nl.
  
question(ddamage) :-
  write('���������� �� � �������� �������������� ���� ��������� �����?'), nl.



% Answers for the knowledge base
answer(offense) :-
  write('�����').

answer(defence) :-
  write('������').
  
answer(tank) :-
  write('����').
  
answer(support) :-
  write('���������').

answer(easy) :-
  write('�����').
  
answer(mid) :-
  write('������').
  
answer(hard) :-
  write('������').
  
answer(yes) :-
  write('��').
  
answer(no) :-
  write('���').
  
answer(short) :-
  write('�� ��������').
  
answer(average) :-
  write('�� �������').
  
answer(speed) :-
  write('��������').
  
answer(tp) :-
  write('������������').
  
answer(prshort) :-
  write('���������������, �������').
  
answer(any) :-
  write('�����').


% Language descriptions for the knowledge base
describe(pharah) :-
  write('�����').

describe(reaper) :-
  write('����').
  
describe(soldier76) :-
  write('������ 76').
  
describe(mccree) :-
  write('������').
  
describe(tracer) :-
  write('�������').
  
describe(sombra) :-
  write('������').
  
describe(doomfist) :-
  write('����� ������').
  
describe(genji) :-
  write('������').

describe(bastion) :-
  write('�������').
  
describe(widow) :-
  write('������� �����').
  
describe(junkrat) :-
  write('���������').
  
describe(torbjorn) :-
  write('��������').
  
describe(hanzo) :-
  write('������').
  
describe(mei) :-
  write('���').
  
describe(roadhog) :-
  write('���������').
  
describe(reinhardt) :-
  write('���������').
  
describe(winston) :-
  write('�������').
  
describe(dva) :-
  write('�.��').
  
describe(orisa) :-
  write('�����').
  
describe(zarya) :-
  write('����').
   
describe(brigitte) :-
  write('��������').
  
describe(mercy) :-
  write('�����').
  
describe(lucio) :-
  write('�����').

describe(moira) :-
  write('�����').

describe(symmetra) :-
  write('��������').
  
describe(zenyatta) :-
  write('���������').
  
describe(ana) :-
  write('���').
  

% Assigns an answer to questions from the knowledge base
role(Answer) :-
  progress(role, Answer).
role(Answer) :-
  \+ progress(role, _),
  ask(role, Answer, [offense, defence, tank, support]).

diff(Answer) :-
  progress(diff, Answer).
diff(Answer) :-
  \+ progress(diff, _),
  ask(diff, Answer, [easy, mid, hard]).
  
vertical(Answer) :-
  progress(vertical, Answer).
vertical(Answer) :-
  \+ progress(vertical, _),
  ask(vertical, Answer, [yes, no]).
  
sdistance(Answer) :-
  progress(sdistance, Answer).
sdistance(Answer) :-
  \+ progress(sdistance, _),
  ask(sdistance, Answer, [short, average]).
  
teamup(Answer) :-
  progress(teamup, Answer).
teamup(Answer) :-
  \+ progress(teamup, _),
  ask(teamup, Answer, [yes, no]).
  
invis(Answer) :-
  progress(invis, Answer).
invis(Answer) :-
  \+ progress(invis, _),
  ask(invis, Answer, [yes, no]).
  
procast(Answer) :-
  progress(procast, Answer).
procast(Answer) :-
  \+ progress(procast, _),
  ask(procast, Answer, [yes, no]).
  
snipe(Answer) :-
  progress(snipe, Answer).
snipe(Answer) :-
  \+ progress(snipe, _),
  ask(snipe, Answer, [yes, no]).
  
grenade(Answer) :-
  progress(grenade, Answer).
grenade(Answer) :-
  \+ progress(grenade, _),
  ask(grenade, Answer, [yes, no]).
  
bow(Answer) :-
  progress(bow, Answer).
bow(Answer) :-
  \+ progress(bow, _),
  ask(bow, Answer, [yes, no]).
  
hook(Answer) :-
  progress(hook, Answer).
hook(Answer) :-
  \+ progress(hook, _),
  ask(hook, Answer, [yes, no]).
  
damage(Answer) :-
  progress(damage, Answer).
damage(Answer) :-
  \+ progress(damage, _),
  ask(damage, Answer, [no, yes]).
  
ddistance(Answer) :-
  progress(ddistance, Answer).
ddistance(Answer) :-
  \+ progress(ddistance, _),
  ask(ddistance, Answer, [prshort, any]).
  
block(Answer) :-
  progress(block, Answer).
block(Answer) :-
  \+ progress(block, _),
  ask(block, Answer, [yes, no]).
  
speedtp(Answer) :-
  progress(speedtp, Answer).
speedtp(Answer) :-
  \+ progress(speedtp, _),
  ask(speedtp, Answer, [speed, tp]).
  
heal(Answer) :-
  progress(heal, Answer).
heal(Answer) :-
  \+ progress(heal, _),
  ask(heal, Answer, [yes, no]).
  
ddamage(Answer) :-
  progress(ddamage, Answer).
ddamage(Answer) :-
  \+ progress(ddamage, _),
  ask(ddamage, Answer, [yes, no]).


% Outputs a nicely formatted list of answers
% [First|Rest] is the Choices list, Index is the index of First in Choices
answers([], _).
answers([First|Rest], Index) :-
  write(Index), write(' '), answer(First), nl,
  NextIndex is Index + 1,
  answers(Rest, NextIndex).


% Parses an Index and returns a Response representing the "Indexth" element in
% Choices (the [First|Rest] list)
parse(0, [First|_], First).
parse(Index, [First|Rest], Response) :-
  Index > 0,
  NextIndex is Index - 1,
  parse(NextIndex, Rest, Response).


% Asks the Question to the user and saves the Answer
ask(Question, Answer, Choices) :-
  question(Question),
  answers(Choices, 0),
  read(Index),
  parse(Index, Choices, Response),
  asserta(progress(Question, Response)),
  Response = Answer.