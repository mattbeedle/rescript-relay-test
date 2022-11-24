let apiUrl = "https://test.com"

type extension = {code: string}
type error = {
  path: string,
  message: string,
  extensions: option<extension>,
}

/* This is just a custom exception to indicate that something went wrong. */
exception Graphql_error(string)
@ocaml.doc("
 * A standard fetch that sends our operation and variables to the
 * GraphQL server, and then decodes and returns the response.
 ")
let fetchQuery: RescriptRelay.Network.fetchFunctionPromise = (
  operation,
  variables,
  _cacheConfig,
  _uploadables,
) => {
  open Fetch
  fetchWithInit(
    apiUrl,
    RequestInit.make(
      ~method_=Post,
      ~body=Js.Dict.fromList(list{
        ("query", Js.Json.string(operation.text)),
        ("variables", variables),
      })
      ->Js.Json.object_
      ->Js.Json.stringify
      ->BodyInit.make,
      (),
    ),
  ) |> Js.Promise.then_(resp =>
    if Response.ok(resp) {
      let a = Response.json(resp)
      a->Js.Promise.then_(res => {
        let response = res->Obj.magic
        let errors: option<array<error>> = response["errors"]
        switch errors {
        | Some(errors) =>
          let error = errors->Belt.Array.get(0)
          switch error {
          | Some(error) =>
            switch error.extensions {
            | Some(extensions) =>
              switch extensions.code {
              | "UNAUTHORIZED" => ()
              | _ => ()
              }
            | None => ()
            }
          | None => ()
          }
        | None => ()
        }
        Js.Promise.resolve(res)
      }, _)->ignore
      a
    } else {
      Js.Promise.reject(Graphql_error("Request failed: " ++ Response.statusText(resp)))
    }
  )
}

let network = RescriptRelay.Network.makePromiseBased(
  ~fetchFunction=fetchQuery,
  (),
)

let environment = RescriptRelay.Environment.make(
  ~network,
  ~store=RescriptRelay.Store.make(
    ~source=RescriptRelay.RecordSource.make(),
    ~gcReleaseBufferSize=10 /* This sets the query cache size to 10 */,
    (),
  ),
  (),
)
