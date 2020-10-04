type mirrorangle = Forward | Backward
type direction = Up | Down | Left | Right
type location = Pair of int * int
type mirror = {
    angle: mirrorangle;
    loc: location;
}

val translate_char : char -> location list -> char
val translate_string : string -> string
val move : location -> direction -> location list -> location
val reflect : direction -> mirror -> direction
