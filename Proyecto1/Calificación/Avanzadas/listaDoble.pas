program listaDoble;

type
Points = object
var right : integer;
var left : integer;
end;

type
Node = object
var idx : integer;
var val : integer;
var point : Points;
end;

type
DoubleList = array[1..20] of Node;

var actualDL : DoubleList;
var count : integer = 1;
var first : integer = -1;
var last : integer = -1;

var aux1, aux2, aux3, aux4, aux5, aux6, aux7, aux8, aux9, aux10, aux11, aux12 : Points;

procedure InsertFirst(val : integer);
var root : Node;
var aux : Node;
begin
    if (first <> -1) then
    begin
        aux := actualDL[first];

        first := count;

        root.idx := count;
        root.val := val;
        aux1 := root.point;
        aux1.left := -1;
        aux1.right := aux.idx;
        root.point := aux1;

        aux2 := aux.point;
        aux2.left := root.idx;
        aux.point := aux2;
        actualDL[aux.idx] := aux;
    end
    else
    begin
        first := count;
        last := first;

        root.idx := count;
        root.val := val;
        aux3 := root.point;
        aux3.left := -1;
        aux3.right := -1;
        root.point := aux3;
    end;
    actualDL[count] := root;
    count := count + 1;
end;

procedure InsertLast(val : integer);
    var root : Node;
    var aux : Node;
    begin
        if (first <> -1) then
        begin
            aux := actualDL[last];

            last := count;

            root.idx := count;
            root.val := val;
            aux4 := root.point;
            aux4.left := aux.idx;
            aux4.right := -1;
            root.point := aux4;

            aux5 := aux.point;
            aux5.right := root.idx;
            aux.point := aux5;
            actualDL[aux.idx] := aux;
        end
        else
        begin
            first := count;
            last := first;

            root.idx := count;
            root.val := val;
            aux6 := root.point;
            aux6.left := -1;
            aux6.right := -1;
            root.point := aux6;
        end;
        actualDL[count] := root;
        count := count + 1;
end;

procedure InsertInto(val, pos : integer);
var root : Node;
var aux : Node;
var newNode : Node;
var i : integer = 0;
begin
    if (first = -1) or (pos = 0) then
    begin
        InsertFirst(val);
    end
    else if ((count - 1) = pos) then
    begin
        InsertLast(val);
    end
    else
    begin
        root := actualDL[first];
        aux.idx := -1;

        repeat
            aux := root;
            aux10 := root.point;
            root := actualDL[aux10.right];
            i := i + 1;
        until (i <> pos);
        newNode.idx := count;
        newNode.val := val;
        aux7 := newNode.point;
        aux7.left := aux.idx;
        aux7.right := root.idx;
        newNode.point := aux7;

        aux8 := aux.point;
        aux8.right := newNode.idx;
        aux.point := aux8;
        actualDL[aux.idx] := aux;

        aux9 := root.point;
        aux9.left := newNode.idx;
        root.point := aux9;
        actualDL[root.idx] := root;

        actualDL[count] := newNode;
        count := count + 1;
    end;
end;

procedure PrintListNormal();
var actual : Node;
var i : integer;
begin
    if (first <> -1) then
    begin
        i := first;
        repeat
            actual := actualDL[i];
            write('Valor de nodo: ');
            writeln(actual.val);
            aux11 := actual.point;
            i := aux11.right;
        until (actual.idx = last);
    end;
end;

procedure PrintListback();
var actual : Node;
var i : integer;
begin
    if (first <> -1) then
    begin
        i := last;
        repeat
            actual := actualDL[i];
            write('Valor de nodo: ');
            writeln(actual.val);
            aux12 := actual.point;
            i := aux12.left;
        until (actual.idx = first);
    end;
end;

begin
    writeln('---Insertando al inicio---');
    InsertFirst(5);
    InsertFirst(7);
    InsertFirst(10);
    PrintListNormal();
    writeln('---Insertando al final---');
    InsertLast(21);
    InsertLast(1);
    InsertLast(4);
    PrintListNormal();
    writeln('---Insertando ambos---');
    InsertLast(100);
    InsertFirst(50);
    InsertLast(8);
    InsertFirst(50);
    InsertFirst(101);
    PrintListNormal();
    writeln('---Imprimiendo desde atras---');
    PrintListback();
    writeln('---Insertando en 2, 5, 10---');
    InsertInto(18, 2);
    InsertInto(17, 5);
    InsertInto(16, 10);
    PrintListNormal();
end.

{
    ---Insertando al inicio---
Valor de nodo: 10
Valor de nodo: 7
Valor de nodo: 5
---Insertando al final---
Valor de nodo: 10
Valor de nodo: 7
Valor de nodo: 5
Valor de nodo: 21
Valor de nodo: 1
Valor de nodo: 4
---Insertando ambos---
Valor de nodo: 101
Valor de nodo: 50
Valor de nodo: 50
Valor de nodo: 10
Valor de nodo: 7
Valor de nodo: 5
Valor de nodo: 21
Valor de nodo: 1
Valor de nodo: 4
Valor de nodo: 100
Valor de nodo: 8
---Imprimiendo desde atras---
Valor de nodo: 8
Valor de nodo: 100
Valor de nodo: 4
Valor de nodo: 1
Valor de nodo: 21
Valor de nodo: 5
Valor de nodo: 7
Valor de nodo: 10
Valor de nodo: 50
Valor de nodo: 50
Valor de nodo: 101
---Insertando en 2, 5, 10---
Valor de nodo: 101
Valor de nodo: 16
Valor de nodo: 17
Valor de nodo: 18
Valor de nodo: 50
Valor de nodo: 50
Valor de nodo: 10
Valor de nodo: 7
Valor de nodo: 5
Valor de nodo: 21
Valor de nodo: 1
Valor de nodo: 4
Valor de nodo: 100
Valor de nodo: 8
}
