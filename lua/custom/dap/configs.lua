local dap = {}
local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end
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
    name = "jrcas get_hightorque",
    type = "python",
    request = "launch",
    program = "/home/nikos.trembois/joby/repos/FlightPhysics/rcasUtils/joby_rcasutils/jrcas_cli.py",
    args = { 'get_hightorque', 'metatable_with_new_cols_filtered_by_thrust_and_damping.pkl'},
    cwd = '/home/nikos.trembois/joby/tests/metatable/fullish/',
    subProcess = false,
  },

}
if file_exists('.dap-configs') then
  local fileconfigs = require '.dap-configs'
  print(fileconfigs)
  for _, v in pairs(fileconfigs.python) do
    print(v)
    table.insert(dap.python, v)
  end
end

return dap
