(**************************************************************************)
(*  cairo-ocaml -- Objective Caml bindings for Cairo                      *)
(*  Copyright © 2004-2005 Olivier Andrieu                                 *)
(*                                                                        *)
(*  This code is free software and is licensed under the terms of the     *)
(*  GNU Lesser General Public License version 2.1 (the "LGPL").           *)
(**************************************************************************)

type surface = [`Any|`PDF] Cairo.surface

external surface_create_for_stream_unsafe : 
  (string -> int -> unit) ->
  width_in_points:float -> 
  height_in_points:float -> surface = "ml_cairo_pdf_surface_create_for_stream_unsafe"

let unsafe_output_string oc s n =
  for i = 0 to n - 1 do
    output_char oc (String.unsafe_get s i)
  done

let surface_create_for_channel oc ~width_in_points ~height_in_points =
  surface_create_for_stream_unsafe
    (unsafe_output_string oc) ~width_in_points ~height_in_points

external surface_create_for_stream :
  (string -> unit) ->
  width_in_points:float -> 
  height_in_points:float -> surface = "ml_cairo_pdf_surface_create_for_stream"

external set_dpi :
  [> `PDF] Cairo.surface -> x_dpi:float -> y_dpi:float -> unit = "ml_cairo_pdf_surface_set_dpi"
