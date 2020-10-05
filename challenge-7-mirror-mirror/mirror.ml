type angle = Forward | Backward
type direction = Up | Down | Left | Right
type location = int * int
type edgenode = char * location * direction
type mirror = angle * location
exception GenericException of string;;

(* DATA *)
let mirrors = [
    (Forward, (4, 1));
    (Backward, (5, 1));
    (Forward, (8, 1));
    (Backward, (9, 1));
    (Backward, (13, 2));
    (Forward, (4, 3));
    (Backward, (7, 4));
    (Forward, (13, 4));
    (Backward, (5, 5));
    (Forward, (3, 6));
    (Forward, (10, 6));
    (Backward, (1, 7));
    (Forward, (4, 7));
    (Forward, (11, 7));
    (Backward, (6, 8));
    (Backward, (1, 9));
    (Backward, (2, 9));
    (Forward, (1, 10));
    (Backward, (11, 11));
    (Backward, (5, 12));
    (Forward, (6, 12));
    (Forward, (4, 13));
    (Forward, (12, 13));
];;

let edgenodes = [
    ('a', (1, 0), Down);
    ('b', (2, 0), Down);
    ('c', (3, 0), Down);
    ('d', (4, 0), Down);
    ('e', (5, 0), Down);
    ('f', (6, 0), Down);
    ('g', (7, 0), Down);
    ('h', (8, 0), Down);
    ('i', (9, 0), Down);
    ('j', (10, 0), Down);
    ('k', (11, 0), Down);
    ('l', (12, 0), Down);
    ('m', (13, 0), Down);
    ('n', (14, 1), Left);
    ('o', (14, 2), Left);
    ('p', (14, 3), Left);
    ('q', (14, 4), Left);
    ('r', (14, 5), Left);
    ('s', (14, 6), Left);
    ('t', (14, 7), Left);
    ('u', (14, 8), Left);
    ('v', (14, 9), Left);
    ('w', (14, 10), Left);
    ('x', (14, 11), Left);
    ('y', (14, 12), Left);
    ('z', (14, 13), Left);
    ('A', (0, 1), Right);
    ('B', (0, 2), Right);
    ('C', (0, 3), Right);
    ('D', (0, 4), Right);
    ('E', (0, 5), Right);
    ('F', (0, 6), Right);
    ('G', (0, 7), Right);
    ('H', (0, 8), Right);
    ('I', (0, 9), Right);
    ('J', (0, 10), Right);
    ('K', (0, 11), Right);
    ('L', (0, 12), Right);
    ('M', (0, 13), Right);
    ('N', (1, 14), Up);
    ('O', (2, 14), Up);
    ('P', (3, 14), Up);
    ('Q', (4, 14), Up);
    ('R', (5, 14), Up);
    ('S', (6, 14), Up);
    ('T', (7, 14), Up);
    ('U', (8, 14), Up);
    ('V', (9, 14), Up);
    ('W', (10, 14), Up);
    ('X', (11, 14), Up);
    ('Y', (12, 14), Up);
    ('Z', (13, 14), Up);
];;

(* FUNCTIONS *)
let rec find_start_node c1 edgenodelist = match edgenodelist with
    | [] -> raise (GenericException "Attempted to find non-existant start node")
    | (c2, loc, dir)::tl ->
        if c1 = c2
        then (c2, loc, dir)
        else find_start_node c1 tl;;

let rec find_mirror loc1 mirrorlist = match mirrorlist with
    | [] -> None
    | (a, loc2)::tl -> 
        if loc1 = loc2
        then Some (a, loc2)
        else find_mirror loc1 tl;;

let rec find_end_node loc1 edgenodelist = match edgenodelist with
    | [] -> None
    | (c, loc2, dir)::tl -> 
        if loc1 = loc2
        then Some (c, loc2, dir)
        else find_end_node loc1 tl;;

let reflect dir (a, _) = match a with
    | Forward -> (match dir with
        | Up -> Right
        | Down -> Left
        | Left -> Down
        | Right -> Up)
    | Backward -> (match dir with
        | Up -> Left
        | Down -> Right
        | Left -> Up
        | Right -> Down);;

let rec move' (x, y) dir = match dir with
    | Up -> (x, y - 1)
    | Down -> (x, y + 1)
    | Left -> (x - 1, y)
    | Right -> (x + 1, y);;

let rec move loc dir = match find_end_node loc edgenodes with
    | Some (c, _, _) -> c
    | None -> match find_mirror loc mirrors with
        | Some mirror ->
            let new_direction = reflect dir mirror in
            move (move' loc new_direction) new_direction
        | None -> move (move' loc dir) dir

let translate_char c = 
    let (_, loc, dir) = find_start_node c edgenodes in
    let first_step = move' loc dir in
    move first_step dir ;;

let translate_string = String.map translate_char;;

(* PLAYGROUND *)
print_string "\n";;
print_string (translate_string "TmixcmCZhxDmrmoaQhxhzmfCDnohyehhxW");;
print_string "\n";;
