local lsp = {}
local utils = {}
local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else return false end
end

utils.concat_fileLines = function(file)
    local dictionary = {}
    if file_exists(file) then
        for line in io.lines(file) do
            table.insert(dictionary, line)
        end
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
            }
        }
    },
    ltex = {
        ltex = {
            additionalRules = {
                enablePickyRules = true,
                languageModel = '/media/nikos/Data/tools/languagetool/ngram/',
                -- I dont know if word2Vec or neuralnetwork are working, but ngram is
                word2VecModel = '/media/nikos/Data/tools/languagetool/word2vec/',
                neuralNetworkModel = '/media/nikos/Data/tools/languagetool/word2vec/neuralnetwork/',
                motherTongue = 'en-US'
            },
            -- completion_enabled = true,
            enabledRules = {
                ["en-US"] = { "ENGLISH_WORD_REPEAT_BEGINNING_RULE", "MASS_AGREEMENT",
                    "EN_REPEATEDWORDS", "CREATIVE_WRITING", "READABILITY_RULE_DIFFICULT", "READABILITY_RULE_SIMPLE",
                    "EN_PLAIN_ENGLISH_REPLACE", "DUE_TO_THE_FACT", "BECAUSE", "HAVE_THE_ABILITY_TO", "EN_CONSISTENT_APOS",
                    "ENGLISH_WORD_REPEAT_RULE", "EN_COMPOUNDS", "REP_PASSIVE_VOICE", "EN_SIMPLE_REPLACE",
                    "ENGLISH_WRONG_WORD_IN_CONTEXT",
                    "TOO_OFTEN_USED_NOUN_EN", "TOO_OFTEN_USED_VERB_EN", "E_PRIME_STRICT" },
            },
            configurationTarget = {
                dictionary = "userExternalFile",
            },
            dictionary = {
                ["en-US"] = utils.concat_fileLines("/media/nikos/Data/tools/languagetool/dictionaries/ltex.dictionary.en-US.txt") },
            statusBarItem = true,
            checkFrequency = "save",
            trace = { ["server"] = "verbose" }
        }
    },
    jsonls = {
        json = {
            -- Create schemas for my erotor, wopwop-post inputs
            schemas = {
                {
                    fileMatch = { 'package.json' },
                    url = 'https://json.schemastore.org/package.json',
                },
                {
                    fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
                    url = 'http://json.schemastore.org/tsconfig',
                },
                {
                    fileMatch = { '*.erotor.json' },
                    url = '/home/nikos/.schemas/schema-erotor.json',
                },
            }
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
