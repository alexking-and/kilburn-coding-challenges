type angle = Forward | Backward
type direction = Up | Down | Left | Right
type location = int * int
type edgenode = char * location * direction
type mirror = angle * location

(* DATA *)
let top_wall = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'];;
let right_wall = ['n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'];;
let left_wall = ['A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'J'; 'K'; 'L'; 'M'];;
let bottom_wall = ['N'; 'O'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'U'; 'V'; 'W'; 'X'; 'Y'; 'Z'];;

(* FUNCTIONS *)
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
