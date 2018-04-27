% Expert system should be started from here
main :-
  intro,
  reset_answers,
  find_animals(Language),
  describe(Language), nl.


intro :-
  write('Какое любимое животное вы бы хотели иметь?'), nl,
  write('Чтобы ответить, введите число, стоящее рядом с ответом с точкой (.) в конце'), nl, nl.


find_animals(Language) :-
  animal(Language), !.


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
animal(inoplanetyanin) :-
  zhiv(no).
 
animal(zmeya) :-
  zhiv(yes),
  ptic(no),
  mlek(no),
  hish(no),
  konc(no).

animal(cherepaha) :-
  zhiv(yes),
  ptic(no),
  mlek(no),
  hish(no),
  konc(yes).

animal(medvedb) :-
  zhiv(yes),
  ptic(no),
  mlek(no),
  hish(yes),
  kosh(no),
  okr1(no).

animal(volk) :-
  zhiv(yes),
  ptic(no),
  mlek(no),
  hish(yes),
  kosh(no),
  okr1(yes).

animal(lev) :-
  zhiv(yes),
  ptic(no),
  mlek(no),
  hish(yes),
  kosh(yes),
  okr2(no).
	
animal(tigr) :-
  zhiv(yes),
  ptic(no),
  mlek(no),
  hish(yes),
  kosh(yes),
  okr2(yes).

animal(bober) :-
  zhiv(yes),
  ptic(no),
  mlek(yes),
  parn(no),
  mokr(no),
  slep(no).

animal(krot) :-
  zhiv(yes),
  ptic(no),
  mlek(yes),
  parn(no),
  mokr(no),
  slep(yes).

animal(zayac) :-
  zhiv(yes),
  ptic(no),
  mlek(yes),
  parn(no),
  mokr(yes).

animal(zebra) :-
  zhiv(yes),
  ptic(no),
  mlek(yes),
  parn(yes),
  plav(no),
  prir(no).

animal(korova) :-
  zhiv(yes),
  ptic(no),
  mlek(yes),
  parn(yes),
  plav(no),
  prir(yes).

animal(slon) :-
  zhiv(yes),
  ptic(no),
  mlek(yes),
  parn(yes),
  plav(yes).

animal(kivi) :-
  zhiv(yes),
  ptic(yes),
  uplv(no),
  pla1(no),
  dlin(no).

animal(straus) :-
  zhiv(yes),
  ptic(yes),
  uplv(no),
  pla1(no),
  dlin(yes).

animal(pingvin) :-
  zhiv(yes),
  ptic(yes),
  uplv(no),
  pla1(yes).

animal(solovei) :-
  zhiv(yes),
  ptic(yes),
  uplv(yes),
  pric(no),
  pla2(no).

animal(utka) :-
  zhiv(yes),
  ptic(yes),
  uplv(yes),
  pric(no),
  pla2(yes).

animal(popygai) :-
  zhiv(yes),
  ptic(yes),
  uplv(yes),
  pric(yes),
  pla3(no).

animal(gysb) :-
  zhiv(yes),
  ptic(yes),
  uplv(yes),
  pric(yes),
  pla3(yes).

  
% Questions for the knowledge base
question(zhiv) :-
  write('Животное?'), nl.
  
question(ptic) :-
  write('Птица?'), nl.

question(mlek) :-
  write('Млекопитающее?'), nl.
  
question(hish) :-
  write('Хищник?'), nl.

question(konc) :-
  write('Имеет конечнсоти?'), nl.

question(okr1) :-
  write('Имеет яркий окрас?'), nl.

question(okr2) :-
  write('Имеет яркий окрас???'), nl.

question(kosh) :-
  write('Относится к кошачьим?'), nl.

question(parn) :-
  write('Парнокопытное?'), nl.

question(mokr) :-
  write('Меняет окрас?'), nl.

question(slep) :-
  write('Слеп с рождения?'), nl.

question(plav) :-
  write('Плавает?'), nl.

question(prir) :-
  write('Приручено человеком?'), nl.
  
question(uplv) :-
  write('Умеет плавать?'), nl.
  
question(pla1) :-
  write('Плавает?1'), nl.
  
question(dlin) :-
  write('Имеет длинную шею?'), nl.
  
question(pric) :-
  write('Приручена человеком???'), nl.
  
question(pla2) :-
  write('Плавает?2'), nl.
  
question(pla3) :-
  write('Плавает?3'), nl.



% Answers for the knowledge base
answer(yes) :-
  write('Да').
  
answer(no) :-
  write('Нет').

  
% Language descriptions for the knowledge base
describe(inoplanetyanin) :-
  write('Инопланетянин').

describe(zmeya) :-
  write('Змея').
  
describe(cherepaha) :-
  write('Черепаха').
  
describe(medvedb) :-
  write('Медведь').
  
describe(volk) :-
  write('Волк').
  
describe(lev) :-
  write('Лев').
  
describe(tigr) :-
  write('Тигр').
  
describe(bober) :-
  write('Бобер').

describe(krot) :-
  write('Крот').
  
describe(zayac) :-
  write('Заяц').
  
describe(zebra) :-
  write('Зебра').
  
describe(korova) :-
  write('Корова').
  
describe(slon) :-
  write('Слон').
  
describe(kivi) :-
  write('Киви').
  
describe(straus) :-
  write('Страус').
  
describe(pingvin) :-
  write('Пингвин').
  
describe(solovei) :-
  write('Соловей').
  
describe(utka) :-
  write('Дикая утка').
  
describe(popygai) :-
  write('Волнистый попугай').
  
describe(gysb) :-
  write('Гусь').

  
% Assigns an answer to questions from the knowledge base
zhiv(Answer) :-
  progress(zhiv, Answer).
zhiv(Answer) :-
  \+ progress(zhiv, _),
  ask(zhiv, Answer, [yes, no]).

ptic(Answer) :-
  progress(ptic, Answer).
ptic(Answer) :-
  \+ progress(ptic, _),
  ask(ptic, Answer, [yes, no]).
  
mlek(Answer) :-
  progress(mlek, Answer).
mlek(Answer) :-
  \+ progress(mlek, _),
  ask(mlek, Answer, [yes, no]).
  
hish(Answer) :-
  progress(hish, Answer).
hish(Answer) :-
  \+ progress(hish, _),
  ask(hish, Answer, [yes, no]).
  
konc(Answer) :-
  progress(konc, Answer).
konc(Answer) :-
  \+ progress(konc, _),
  ask(konc, Answer, [yes, no]).
  
okr1(Answer) :-
  progress(okr1, Answer).
okr1(Answer) :-
  \+ progress(okr1, _),
  ask(okr1, Answer, [yes, no]).
  
okr2(Answer) :-
  progress(okr2, Answer).
okr2(Answer) :-
  \+ progress(okr2, _),
  ask(okr2, Answer, [yes, no]).
  
kosh(Answer) :-
  progress(kosh, Answer).
kosh(Answer) :-
  \+ progress(kosh, _),
  ask(kosh, Answer, [yes, no]).
  
parn(Answer) :-
  progress(parn, Answer).
parn(Answer) :-
  \+ progress(parn, _),
  ask(parn, Answer, [yes, no]).
  
mokr(Answer) :-
  progress(mokr, Answer).
mokr(Answer) :-
  \+ progress(mokr, _),
  ask(mokr, Answer, [yes, no]).
  
slep(Answer) :-
  progress(slep, Answer).
slep(Answer) :-
  \+ progress(slep, _),
  ask(slep, Answer, [yes, no]).
  
plav(Answer) :-
  progress(plav, Answer).
plav(Answer) :-
  \+ progress(plav, _),
  ask(plav, Answer, [yes, no]).
  
prir(Answer) :-
  progress(prir, Answer).
prir(Answer) :-
  \+ progress(prir, _),
  ask(prir, Answer, [yes, no]).
  
uplv(Answer) :-
  progress(uplv, Answer).
uplv(Answer) :-
  \+ progress(uplv, _),
  ask(uplv, Answer, [yes, no]).
  
pla1(Answer) :-
  progress(pla1, Answer).
pla1(Answer) :-
  \+ progress(pla1, _),
  ask(pla1, Answer, [yes, no]).
  
dlin(Answer) :-
  progress(dlin, Answer).
dlin(Answer) :-
  \+ progress(dlin, _),
  ask(dlin, Answer, [yes, no]).
  
pric(Answer) :-
  progress(pric, Answer).
pric(Answer) :-
  \+ progress(pric, _),
  ask(pric, Answer, [yes, no]).
  
pla2(Answer) :-
  progress(pla2, Answer).
pla2(Answer) :-
  \+ progress(pla2, _),
  ask(pla2, Answer, [yes, no]).
  
pla3(Answer) :-
  progress(pla3, Answer).
pla3(Answer) :-
  \+ progress(pla3, _),
  ask(pla3, Answer, [yes, no]).


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