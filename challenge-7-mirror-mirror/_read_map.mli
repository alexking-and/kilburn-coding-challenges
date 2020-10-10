type angle = Forward | Backward
type direction = Up | Down | Left | Right
type location = int * int
type edgenode = char * location * direction
type mirror = angle * location

(* file path -> list of edge nodes -> list of mirrors *)
val read_map_file : string -> edgenode list * mirror list
