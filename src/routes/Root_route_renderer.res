let renderer = Routes.Root.Route.makeRenderer(
  ~prepare=props => {
    ()
  },
  ~render=props => {
    <Root />
  },
  (),
)