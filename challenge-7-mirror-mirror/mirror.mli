type angle = Forward | Backward
type direction = Up | Down | Left | Right
type location = int * int
type edgenode = char * location * direction
type mirror = angle * location

(* char to translate -> translated char  *)
val translate_char : char -> char

(* string to translate -> translated string *)
val translate_string : string -> string

(* current location -> current direction -> translated char *)
val move : location -> direction -> char

(* current direction -> mirror -> next direction *)
val reflect : direction -> mirror -> direction

(* char to find -> list of nodes -> corresponding node *)
val find_start_node : char -> edgenode list -> edgenode

(* location -> list of edgenodes -> mirror at location (or none) *)
val find_end_node : location -> edgenode list -> edgenode option

(* location -> list of mirrors -> mirror at location (or none) *)
val find_mirror : location -> mirror list -> mirror option
