local lsp = {}
local utils = {}
utils.concat_fileLines = function(file)
    local dictionary = {}
    for line in io.lines(file) do
        table.insert(dictionary, line)
    end
    return dictionary
end

lsp.servers = {
    pylsp = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'E501', 'W503', 'W504', 'E704', 'E731' },
                    maxLineLength = 120
                },
                jedi_completion = {
                    cache_for = { "pandas", "numpy", "tensorflow", "matplotlib" }
                }
            }
        }
    },
    ltex = {
        ltex = {
            additionalRules = {
                languageModel = '/media/nikos/Data/tools/languagetool/ngram',
                word2VecModel = '/media/nikos/Data/tools/languagetool/word2vec/en',
                motherTongue = 'en-US'
            },
            enabledRules = {
                ["en-US"] = { "MASS_AGREEMENT" },
            },
            configurationTarget = {
                dictionary = "userExternalFile",
            },
            dictionary = { ["en-US"] = utils.concat_fileLines("/media/nikos/Data/tools/languagetool/dictionaries/english.txt") },
        }
    },
}

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

local function tableMerge(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tableMerge(t1[k] or {}, t2[k] or {})
            else
                -- t1[k] = v
                t1[#t1 + 1] = v
            end
        else
            -- t1[k] = v
            t1[#t1 + 1] = v
        end
    end
    return t1
end

local fpath = ".nvim-lsp-configs"
local localconfigs = prequire(fpath)
if localconfigs then
    tableMerge(lsp.servers.pylsp, localconfigs)
end

return lsp
