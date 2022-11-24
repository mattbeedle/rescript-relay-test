// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Js_dict from "rescript/lib/es6/js_dict.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as ReactRouter from "react-router";
import * as RelayRouter__Utils from "rescript-relay-router/src/RelayRouter__Utils.mjs";

function makePrepareProps(environment, pathParams, queryParams, $$location) {
  return {
          environment: environment,
          location: $$location
        };
}

var Internal = {
  makePrepareProps: makePrepareProps
};

function makeLink(param) {
  return ReactRouter.generatePath("/", Js_dict.fromArray([]));
}

function isRouteActive($staropt$star, param) {
  var exact = $staropt$star !== undefined ? $staropt$star : false;
  return Belt_Option.isSome(Caml_option.nullable_to_opt(ReactRouter.matchPath({
                      path: "/",
                      end: exact
                    }, param.pathname)));
}

function useIsRouteActive(exactOpt, param) {
  var exact = exactOpt !== undefined ? exactOpt : false;
  var $$location = RelayRouter__Utils.useLocation(undefined);
  return React.useMemo((function () {
                return isRouteActive(exact, $$location);
              }), [
              $$location,
              exact
            ]);
}

export {
  Internal ,
  makeLink ,
  isRouteActive ,
  useIsRouteActive ,
}
/* react Not a pure module */
