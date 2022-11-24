
open RelayRouter__Internal__DeclarationsSupport

external unsafe_toPrepareProps: 'any => prepareProps = "%identity"


@val external import__Root: (@as(json`"@rescriptModule/Root_route_renderer"`) _, unit) => Js.Promise.t<RouteRenderer.t> = "import"

@val external import__DynamicBroken: (@as(json`"@rescriptModule/DynamicBroken_route_renderer"`) _, unit) => Js.Promise.t<RouteRenderer.t> = "import"

@val external import__Working: (@as(json`"@rescriptModule/Working_route_renderer"`) _, unit) => Js.Promise.t<RouteRenderer.t> = "import"

@val external import__FourOhFour: (@as(json`"@rescriptModule/FourOhFour_route_renderer"`) _, unit) => Js.Promise.t<RouteRenderer.t> = "import"

let loadedRouteRenderers: Belt.HashMap.String.t<loadedRouteRenderer> = Belt.HashMap.String.make(
  ~hintSize=4,
)

let make = (~prepareDisposeTimeout=5 * 60 * 1000, ()): array<RelayRouter.Types.route> => {
  let {prepareRoute, getPrepared} = makePrepareAssets(~loadedRouteRenderers, ~prepareDisposeTimeout)

  [
      {
    let routeName = "Root"
    let loadRouteRenderer = () => import__Root->doLoadRouteRenderer(~routeName, ~loadedRouteRenderers)
    let makePrepareProps = (. 
    ~environment: RescriptRelay.Environment.t,
    ~pathParams: Js.Dict.t<string>,
    ~queryParams: RelayRouter.Bindings.QueryParams.t,
    ~location: RelayRouter.History.location,
  ): prepareProps => {
    ignore(pathParams)
    ignore(queryParams)
    let prepareProps: Route__Root_route.Internal.prepareProps =   {
      environment: environment,
  
      location: location,
    }
    prepareProps->unsafe_toPrepareProps
  }
  
    {
      path: "/",
      name: routeName,
      chunk: "Root_route_renderer",
      loadRouteRenderer,
      preloadCode: (
        . ~environment: RescriptRelay.Environment.t,
        ~pathParams: Js.Dict.t<string>,
        ~queryParams: RelayRouter.Bindings.QueryParams.t,
        ~location: RelayRouter.History.location,
      ) => preloadCode(
        ~loadedRouteRenderers,
        ~routeName,
        ~loadRouteRenderer,
        ~environment,
        ~location,
        ~makePrepareProps,
        ~pathParams,
        ~queryParams,
      ),
      prepare: (
        . ~environment: RescriptRelay.Environment.t,
        ~pathParams: Js.Dict.t<string>,
        ~queryParams: RelayRouter.Bindings.QueryParams.t,
        ~location: RelayRouter.History.location,
        ~intent: RelayRouter.Types.prepareIntent,
      ) => prepareRoute(
        .
        ~environment,
        ~pathParams,
        ~queryParams,
        ~location,
        ~getPrepared,
        ~loadRouteRenderer,
        ~makePrepareProps,
        ~makeRouteKey=(
    ~pathParams: Js.Dict.t<string>,
    ~queryParams: RelayRouter.Bindings.QueryParams.t
  ): string => {
    ignore(pathParams)
    ignore(queryParams)
  
    "Root:"
  
  
  }
  
  ,
        ~routeName,
        ~intent
      ),
      children: [],
    }
  },
  {
    let routeName = "DynamicBroken"
    let loadRouteRenderer = () => import__DynamicBroken->doLoadRouteRenderer(~routeName, ~loadedRouteRenderers)
    let makePrepareProps = (. 
    ~environment: RescriptRelay.Environment.t,
    ~pathParams: Js.Dict.t<string>,
    ~queryParams: RelayRouter.Bindings.QueryParams.t,
    ~location: RelayRouter.History.location,
  ): prepareProps => {
    ignore(queryParams)
    let prepareProps: Route__DynamicBroken_route.Internal.prepareProps =   {
      environment: environment,
  
      location: location,
      item: pathParams->Js.Dict.unsafeGet("item")->Obj.magic,
    }
    prepareProps->unsafe_toPrepareProps
  }
  
    {
      path: "dynamic/:item(foo|bar)",
      name: routeName,
      chunk: "DynamicBroken_route_renderer",
      loadRouteRenderer,
      preloadCode: (
        . ~environment: RescriptRelay.Environment.t,
        ~pathParams: Js.Dict.t<string>,
        ~queryParams: RelayRouter.Bindings.QueryParams.t,
        ~location: RelayRouter.History.location,
      ) => preloadCode(
        ~loadedRouteRenderers,
        ~routeName,
        ~loadRouteRenderer,
        ~environment,
        ~location,
        ~makePrepareProps,
        ~pathParams,
        ~queryParams,
      ),
      prepare: (
        . ~environment: RescriptRelay.Environment.t,
        ~pathParams: Js.Dict.t<string>,
        ~queryParams: RelayRouter.Bindings.QueryParams.t,
        ~location: RelayRouter.History.location,
        ~intent: RelayRouter.Types.prepareIntent,
      ) => prepareRoute(
        .
        ~environment,
        ~pathParams,
        ~queryParams,
        ~location,
        ~getPrepared,
        ~loadRouteRenderer,
        ~makePrepareProps,
        ~makeRouteKey=(
    ~pathParams: Js.Dict.t<string>,
    ~queryParams: RelayRouter.Bindings.QueryParams.t
  ): string => {
    ignore(queryParams)
  
    "DynamicBroken:"
      ++ pathParams->Js.Dict.get("item")->Belt.Option.getWithDefault("")
  
  }
  
  ,
        ~routeName,
        ~intent
      ),
      children: [],
    }
  },
  {
    let routeName = "Working"
    let loadRouteRenderer = () => import__Working->doLoadRouteRenderer(~routeName, ~loadedRouteRenderers)
    let makePrepareProps = (. 
    ~environment: RescriptRelay.Environment.t,
    ~pathParams: Js.Dict.t<string>,
    ~queryParams: RelayRouter.Bindings.QueryParams.t,
    ~location: RelayRouter.History.location,
  ): prepareProps => {
    ignore(queryParams)
    let prepareProps: Route__Working_route.Internal.prepareProps =   {
      environment: environment,
  
      location: location,
      id: pathParams->Js.Dict.unsafeGet("id"),
    }
    prepareProps->unsafe_toPrepareProps
  }
  
    {
      path: "working/:id",
      name: routeName,
      chunk: "Working_route_renderer",
      loadRouteRenderer,
      preloadCode: (
        . ~environment: RescriptRelay.Environment.t,
        ~pathParams: Js.Dict.t<string>,
        ~queryParams: RelayRouter.Bindings.QueryParams.t,
        ~location: RelayRouter.History.location,
      ) => preloadCode(
        ~loadedRouteRenderers,
        ~routeName,
        ~loadRouteRenderer,
        ~environment,
        ~location,
        ~makePrepareProps,
        ~pathParams,
        ~queryParams,
      ),
      prepare: (
        . ~environment: RescriptRelay.Environment.t,
        ~pathParams: Js.Dict.t<string>,
        ~queryParams: RelayRouter.Bindings.QueryParams.t,
        ~location: RelayRouter.History.location,
        ~intent: RelayRouter.Types.prepareIntent,
      ) => prepareRoute(
        .
        ~environment,
        ~pathParams,
        ~queryParams,
        ~location,
        ~getPrepared,
        ~loadRouteRenderer,
        ~makePrepareProps,
        ~makeRouteKey=(
    ~pathParams: Js.Dict.t<string>,
    ~queryParams: RelayRouter.Bindings.QueryParams.t
  ): string => {
    ignore(queryParams)
  
    "Working:"
      ++ pathParams->Js.Dict.get("id")->Belt.Option.getWithDefault("")
  
  }
  
  ,
        ~routeName,
        ~intent
      ),
      children: [],
    }
  },
  {
    let routeName = "FourOhFour"
    let loadRouteRenderer = () => import__FourOhFour->doLoadRouteRenderer(~routeName, ~loadedRouteRenderers)
    let makePrepareProps = (. 
    ~environment: RescriptRelay.Environment.t,
    ~pathParams: Js.Dict.t<string>,
    ~queryParams: RelayRouter.Bindings.QueryParams.t,
    ~location: RelayRouter.History.location,
  ): prepareProps => {
    ignore(pathParams)
    ignore(queryParams)
    let prepareProps: Route__FourOhFour_route.Internal.prepareProps =   {
      environment: environment,
  
      location: location,
    }
    prepareProps->unsafe_toPrepareProps
  }
  
    {
      path: "*",
      name: routeName,
      chunk: "FourOhFour_route_renderer",
      loadRouteRenderer,
      preloadCode: (
        . ~environment: RescriptRelay.Environment.t,
        ~pathParams: Js.Dict.t<string>,
        ~queryParams: RelayRouter.Bindings.QueryParams.t,
        ~location: RelayRouter.History.location,
      ) => preloadCode(
        ~loadedRouteRenderers,
        ~routeName,
        ~loadRouteRenderer,
        ~environment,
        ~location,
        ~makePrepareProps,
        ~pathParams,
        ~queryParams,
      ),
      prepare: (
        . ~environment: RescriptRelay.Environment.t,
        ~pathParams: Js.Dict.t<string>,
        ~queryParams: RelayRouter.Bindings.QueryParams.t,
        ~location: RelayRouter.History.location,
        ~intent: RelayRouter.Types.prepareIntent,
      ) => prepareRoute(
        .
        ~environment,
        ~pathParams,
        ~queryParams,
        ~location,
        ~getPrepared,
        ~loadRouteRenderer,
        ~makePrepareProps,
        ~makeRouteKey=(
    ~pathParams: Js.Dict.t<string>,
    ~queryParams: RelayRouter.Bindings.QueryParams.t
  ): string => {
    ignore(pathParams)
    ignore(queryParams)
  
    "FourOhFour:"
  
  
  }
  
  ,
        ~routeName,
        ~intent
      ),
      children: [],
    }
  }
  ]
}