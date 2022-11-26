@react.component
let make = () => {
  <>
    <p><RelayRouter.Link to_=Routes.DynamicBroken.Route.makeLink(~item=#foo)>{"A broken link" -> React.string}</RelayRouter.Link></p>
    <p><RelayRouter.Link to_="/working/1">{"A working link" -> React.string}</RelayRouter.Link></p>
  </>
}
