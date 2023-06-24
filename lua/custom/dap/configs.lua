local dap = {}

local function prequire(m)
  local ok, err = pcall(require, m)
  if not ok then return nil, err end
  return err
end

local function load(modulename)
   local errmsg = ""
   for path in string.gmatch(package.path, "([^;]+)") do
      local filename = string.gsub(path, "%?", modulename)
      local file = io.open(filename, "rb")
      if file then
         -- Compile and return the module
         return assert(loadstring(assert(file:read("*a")), filename))
      end
      errmsg = errmsg .. "\n\tno file '" .. filename .. "' (checked with custom loader)"
   end
   return errmsg
end
-- table.insert(package.loaders, 2, load) -- this will run before the standard loader, if you want it to
-- run after you can call table.insert(package.loaders, load)
table.insert(package.loaders, load)

dap.python = {
   {
      name = "jrcas filter",
      type = "python",
      request = "launch",
      program = "/home/nikos.trembois/joby/repos/FlightPhysics/rcasUtils/joby_rcasutils/jrcas_cli.py",
      args = { 'filtermeta', 'metatable_with_new_cols_filtered_by_thrust_and_damping.pkl', 'L1_all_prop_conds.csv' },
      cwd = '/home/nikos.trembois/joby/tests/metatable/fullish/',
      subProcess = false,
   },
   {
      name = "jrcas get_hightorque",
      type = "python",
      request = "launch",
      program = "/home/nikos.trembois/joby/repos/FlightPhysics/rcasUtils/joby_rcasutils/jrcas_cli.py",
      args = { 'get_hightorque', 'metatable_with_new_cols_filtered_by_thrust_and_damping.pkl' },
      cwd = '/home/nikos.trembois/joby/tests/metatable/fullish/',
      subProcess = false,
   },

}

-- TODO: allow it to find any file with name .?.dap.lua
-- TODO: load in configs for arbitrary dap (not just python)
local localconfigs = prequire(".dap-configs")
if localconfigs then
   for _, v in pairs(localconfigs.python) do
      table.insert(dap.python, v)
   end
end

return dap
