open Model
open Vdom

let app =
  simple_app
    ~init:(init 500. 500. Avtomat.enke_1mod3)
    ~view:View.view ~update ()

let () =
  let open Js_browser in
  let run () =
    Vdom_blit.run app |> Vdom_blit.dom
    |> Js_browser.Element.append_child
         (match
            Js_browser.Document.get_elements_by_class_name Js_browser.document
              "container"
            |> Array.to_list
          with
         | element :: _ -> element
         | [] -> Js_browser.Document.document_element Js_browser.document)
  in
  Window.set_onload window run
