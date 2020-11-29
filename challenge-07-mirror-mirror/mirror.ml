type angle = Forward | Backward;;
type direction = Up | Down | Left | Right;;
type location = int * int;;
type edgenode = char * location * direction;;
type mirror = angle * location;;
exception GenericException of string;;

(* DATA *)
let top_wall = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'];;
let right_wall = ['n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'];;
let left_wall = ['A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M'];;
let bottom_wall = ['N'; 'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'; 'Z'];;

(* READ MAP *)
let to_edge_node c loc = match c with
    | ' ' -> None
    | '\n' -> None
    | '/' -> None
    | '\\' -> None
    | _ -> 
        if List.mem c top_wall
        then Some (c, loc, Down)
        else if List.mem c right_wall
        then Some (c, loc, Left)
        else if List.mem c left_wall
        then Some (c, loc, Right)
        else if List.mem c bottom_wall
        then Some (c, loc, Up)
        else None;;

let to_mirror c loc = match c with
    | '/' -> Some (Forward, loc)
    | '\\' -> Some (Backward, loc)
    | _ -> None;;

let read_map_file filepath = 
    let in_channel = open_in filepath in
    let rec process_chars (x, y) edgenodes mirrors =
        try
            let c = input_char in_channel in
            match c with
                | '\n' -> process_chars (0, y + 1) edgenodes mirrors
                | _ -> match to_mirror c (x, y) with
                    | Some mir -> process_chars (x + 1, y) edgenodes (mir :: mirrors)
                    | None -> match to_edge_node c (x, y) with
                        | Some node -> process_chars (x + 1, y) (node :: edgenodes) mirrors
                        | None -> process_chars (x + 1, y) edgenodes  mirrors
        with End_of_file ->
            close_in in_channel;
            edgenodes, mirrors in
    process_chars (0, 0) [] [];;

(* DECODE *)
let edgenodes, mirrors = read_map_file "./data/grid.txt";;

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

(* PRESENT ANSWER *)
print_string "The decoded string is:\n";;
print_string (decode_string "TmixcmCZhxDmrmoaQhxhzmfCDnohyehhxW");;
print_string "\n";;
