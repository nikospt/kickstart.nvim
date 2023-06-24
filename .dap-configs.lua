local dap = {}
dap.python = {

  {
    name = "jrcas filter",
    type = "python",
    request = "launch",
    program = "/home/nikos.trembois/joby/repos/FlightPhysics/rcasUtils/joby_rcasutils/jrcas_cli.py",
    args = { 'filtermeta', 'metatable_with_new_cols_filtered_by_thrust_and_damping.pkl', 'L1_all_prop_conds.csv'},
    cwd = '/home/nikos.trembois/joby/tests/metatable/fullish/',
    subProcess = false,
  },
  {
    name = "jrcas get_hightorque 55",
    type = "python",
    request = "launch",
    program = "/home/nikos.trembois/joby/repos/FlightPhysics/rcasUtils/joby_rcasutils/jrcas_cli.py",
    args = { 'get_hightorque', 'metatable_with_new_cols_filtered_by_thrust_and_damping.pkl'},
    cwd = '/home/nikos.trembois/joby/tests/metatable/fullish/',
    subProcess = false,
  },

}
return dap
