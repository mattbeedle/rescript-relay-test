// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Fetch from "bs-fetch/src/Fetch.mjs";
import * as Js_dict from "rescript/lib/es6/js_dict.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Js_promise from "rescript/lib/es6/js_promise.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as RescriptRelay from "rescript-relay/src/RescriptRelay.mjs";
import * as RelayRuntime from "relay-runtime";
import * as Caml_exceptions from "rescript/lib/es6/caml_exceptions.js";

var apiUrl = "https://test.com";

var Graphql_error = /* @__PURE__ */Caml_exceptions.create("RelayEnv.Graphql_error");

function fetchQuery(operation, variables, _cacheConfig, _uploadables) {
  return Js_promise.then_((function (resp) {
                if (!resp.ok) {
                  return Promise.reject({
                              RE_EXN_ID: Graphql_error,
                              _1: "Request failed: " + resp.statusText
                            });
                }
                var a = Fetch.$$Response.json(resp);
                Js_promise.then_((function (res) {
                        var errors = res.errors;
                        if (errors !== undefined) {
                          var error = Belt_Array.get(errors, 0);
                          if (error !== undefined) {
                            var extensions = error.extensions;
                            if (extensions !== undefined) {
                              var match = extensions.code;
                              match === "UNAUTHORIZED";
                            }
                            
                          }
                          
                        }
                        return Promise.resolve(res);
                      }), a);
                return a;
              }), fetch(apiUrl, Fetch.RequestInit.make(/* Post */2, undefined, Caml_option.some(JSON.stringify(Js_dict.fromList({
                                    hd: [
                                      "query",
                                      operation.text
                                    ],
                                    tl: {
                                      hd: [
                                        "variables",
                                        variables
                                      ],
                                      tl: /* [] */0
                                    }
                                  }))), undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined)(undefined)));
}

var network = RelayRuntime.Network.create(fetchQuery, undefined);

var environment = RescriptRelay.Environment.make(network, RescriptRelay.Store.make(new RelayRuntime.RecordSource(undefined), 10, undefined, undefined), undefined, undefined, undefined, undefined, undefined, undefined);

export {
  apiUrl ,
  Graphql_error ,
  fetchQuery ,
  network ,
  environment ,
}
/* network Not a pure module */
