/*Definitions */

digit [0-9]
plus [+]
minus [-]
times [*]
divide [/]
lpar    [(]
rpar    [)]


/* Rules */
%%
[[1-9] [.]? digit+] { return NUMBER; }
plus                { return PLUS; }
minus               { return MINUS; }
divide              { return DIVIDE; }
times               { return TIMES; }
lpar                { return LPAR; }
rpar                { return RPAR; }

%%