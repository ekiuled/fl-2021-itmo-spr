grammar DanglingElse;

stmt:
  expr
| if_stmt
;

if_stmt:
  IF expr THEN stmt
| IF expr THEN stmt ELSE stmt
;

expr:
  ID
;

IF: 'if';
ELSE: 'else';
THEN: 'then';
ID: 'id';