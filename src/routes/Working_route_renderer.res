let renderer = Routes.Working.Route.makeRenderer(
  ~prepare=props => {
    ()
  },
  ~render=props => {
    React.string("A working route")
  },
  (),
)