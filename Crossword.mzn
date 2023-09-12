% Use this editor as a MiniZinc scratch book
% SECTION 1: Parameters
int: n;
int: m;
int: r;
int: s;
set of int: PuzzleRange = r..s;
int: num_o;
array[1..num_o, 1..4] of int: def_o;
int: num_v;
array[1..num_v, 1..4] of int: def_v;
int: digs = ceil(log(10.0,int2float(s)));

% Section 2: variables
array[1..n,1..m] of var 0..s: crossword;
% Section 3: constraints "schema" (neri/ bianchi)
constraint
      forall(i in 1..num_o)(
           if def_o[i,2]+def_o[i,4]<=m then crossword[def_o[i,1],def_o[i,2]+def_o[i,4]]=0 endif);
constraint
      forall(i in 1..num_o)(
            forall(y in def_o[i,2]..def_o[i,2]+def_o[i,4]-1)(crossword[def_o[i,1],y] in PuzzleRange));
constraint
    forall(i in 1..num_v)(
          if def_v[i,1]+def_v[i,4]<=n then crossword[def_v[i,1]+def_v[i,4],def_v[i,2]]=0 endif);
constraint
    forall(i in 1..num_v)(
            forall(x in def_v[i,1]..def_v[i,1]+def_v[i,4]-1)(crossword[x,def_v[i,2]] in PuzzleRange));
%constraint rispettare le definizioni
constraint
     forall(i in 1..num_o)(
         sum(y in def_o[i,2]..def_o[i,2]+def_o[i,4]-1)(crossword[def_o[i,1],y])=def_o[i,3] );
constraint
     forall(i in 1..num_v)(
         sum(x in def_v[i,1]..def_v[i,1]+def_v[i,4]-1)(crossword[x,def_v[i,2]])=def_v[i,3] );
% Section 4: specify problem
solve satisfy;
% Section 5: Output
output [ show_int(digs, crossword[i,j]) ++
        if j == m then "\n" else "   " endif |
        i in 1..n, j in 1..m ];