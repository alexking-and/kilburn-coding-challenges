type mirrorangle = Forward | Backward
type direction = Up | Down | Left | Right
type location = Pair of int * int
type mirror = {
    angle: mirrorangle;
    loc: location;
}

(* char to translate -> list of mirrors -> translated char  *)
val translate_char : char -> mirror list -> char

(* string to translate -> translated string *)
val translate_string : string -> string

(* current location -> current direction -> list of mirrors -> next location and direction *)
val move : location * direction -> mirror list -> location * direction

(* current direction -> mirror -> next direction *)
val reflect : direction -> mirror -> direction
