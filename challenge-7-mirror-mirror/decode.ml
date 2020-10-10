type angle = Forward | Backward
type direction = Up | Down | Left | Right
type location = int * int
type edgenode = char * location * direction
type mirror = angle * location
exception GenericException of string;;

(* DATA *)
let edgenodes, mirrors = Read_map.read_map_file "./data/grid.txt";;

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

let decode_char c = 
    let (_, loc, dir) = find_start_node c edgenodes in
    let first_step = move' loc dir in
    move first_step dir ;;

let decode_string = String.map decode_char;;

(* PLAYGROUND *)
print_string "\n";;
print_string (decode_string "TmixcmCZhxDmrmoaQhxhzmfCDnohyehhxW");;
print_string "\n";;
