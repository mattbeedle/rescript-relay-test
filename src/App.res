ReactDOMExperimental.renderConcurrentRootAtElementWithId(
  <RescriptRelay.Context.Provider environment=RelayEnv.environment>
    <RelayRouter.Provider value={Router.routerContext}>
      <React.Suspense fallback={React.string("Loading...")}>
        <RescriptReactErrorBoundary fallback={_ => React.string("Error!")}>
          <RelayRouter.RouteRenderer
            // This renders all the time, and when there's a pending navigation (pending via React concurrent mode), pending will be `true`
            renderPending={pending => <div>{pending ? React.string("Loading...") : React.null}</div>}
          />
        </RescriptReactErrorBoundary>
      </React.Suspense>
    </RelayRouter.Provider>
  </RescriptRelay.Context.Provider>,
  "root",
)
