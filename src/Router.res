let priority: RelayRouter.Types.preloadPriority = Default

// `cleanup` does not need to run on the client, but would clean up the router after you're done using it, like when doing SSR.
let (_cleanup, routerContext) = RelayRouter.Router.make(
  // RouteDeclarations.res is autogenerated by the router
  ~routes=RouteDeclarations.make(
    // prepareDisposeTimeout - How long is prepared data allowed to live without being used before it's
    // potentially cleaned up? Default is 5 minutes.
    ~prepareDisposeTimeout=5 * 60 * 1000,
    ()
  ),

  // This is your Relay environment
  ~environment=RelayEnv.environment,

  // SSR coming soon. For now, initiate a browser environment for the router
  ~routerEnvironment=RelayRouter.RouterEnvironment.makeBrowserEnvironment(),

  ~preloadAsset = (~priority, _) => ()
)
