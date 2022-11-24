@react.component
let make = () => {
  <>
    <p><RelayRouter.Link to_="/dynamic/foo">{"A broken link" -> React.string}</RelayRouter.Link></p>
    <p><RelayRouter.Link to_="/working/1">{"A working link" -> React.string}</RelayRouter.Link></p>
  </>
}
