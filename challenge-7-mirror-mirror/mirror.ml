type mirrorangle = Forward | Backward
type direction = Up | Down | Left | Right
type location = Pair of int * int
type mirror = {
    angle: mirrorangle;
    loc: location;
}

let reflect dir { angle = a; _ } = match a with
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



(* TESTING PLAYGROUND BELOW *)
print_string "hello world\n";;
let string_to_print dir = match dir with
    | Right -> "right"
    | Left -> "left"
    | Up -> "up"
    | Down -> "down";;
let reflection = reflect Up { angle = Forward; loc = Pair (0, 0); };;
print_string (string_to_print reflection);;
