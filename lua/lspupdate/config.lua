local config = {}

-- Holds the installation/update instructions.
--
-- INTERNAL - end users should not have to edit anything in here,
-- if needed, please submit a ticket.
-- The keys, represent the name of the LSP, as defined in nvim-lspconfig:
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
--
-- The values represent a micro DSL, as follows:
-- {npm,go,pip,gem,etc.}|package1[,package2[,...]]
-- where packageN is a package installable by the corresponding command.
--
-- LuaFormatter off
config.config = {
  als                    = "",
  angularls              = "npm|@angular/language-server",
  bashls                 = "npm|bash-language-server",
  beancount              = "npm|@bryall/beancount-langserver",
  ccls                   = "",
  clangd                 = "",
  clojure_lsp            = "nix|clojure-lsp",
  cmake                  = "pip|cmake-language-server",
  codeqlls               = "",
  crystalline            = "",
  cssls                  = "npm|vscode-langservers-extracted",
  dartls                 = "",
  denols                 = "cargo|deno",
  dhall_lsp_server       = "cabal|dhall-lsp-server",
  diagnosticls           = "npm|diagnostic-languageserver",
  dockerls               = "npm|dockerfile-language-server-nodejs",
  dotls                  = "npm|dot-language-server",
  efm                    = "go|github.com/mattn/efm-langserver",
  elixirls               = "",
  elmls                  = "npm|elm,elm-test,elm-format,@elm-tooling/elm-language-server",
  erlangls               = "",
  flow                   = "npm|flow-bin",
  fortls                 = "pip|fortran-language-server",
  fsautocomplete         = "",
  gdscript               = "",
  ghcide                 = "",
  gopls                  = "go|golang.org/x/tools/gopls@latest",
  graphql                = "npm|graphql-language-service-cli",
  groovyls               = "",
  haxe_language_server   = "",
  hie                    = "",
  hls                    = "",
  html                   = "npm|vscode-langservers-extracted",
  intelephense           = "npm|intelephense",
  java_language_server   = "",
  jdtls                  = "",
  jedi_language_server   = "pip|jedi-language-server",
  jsonls                 = "npm|vscode-langservers-extracted",
  julials                = "",
  kotlin_language_server = "",
  lean3ls                = "",
  leanls                 = "npm|lean-language-server",
  metals                 = "",
  nimls                  = "nim|nimlsp",
  ocamlls                = "npm|ocaml-langauge-server",
  ocamllsp               = "",
  omnisharp              = "",
  perlls                 = "",
  phpactor               = "",
  powershell_es          = "",
  prismals               = "npm|@prisma/language-server",
  purescriptls           = "npm|purescript-language-server",
  pyls                   = "pip|python-language-server",
  pyls_ms                = "",
  pylsp                  = "pip|python-lsp-server",
  pyright                = "npm|pyright",
  r_language_server      = "r|languageserver",
  racket_langserver      = "raco|racket-langserver",
  rescriptls             = "",
  rls                    = "rust|rls,rust-analysis,rust-src",
  rnix                   = "cargo|rnix-lsp",
  rome                   = "npm|rome",
  rust_analyzer          = "",
  scry                   = "",
  solargraph             = "gem|solargraph",
  sorbet                 = "gem|sorbet",
  sourcekit              = "",
  sqlls                  = "npm|sql-language-server",
  sqls                   = "go|github.com/lighttiger2505/sqls",
  stylelint_lsp          = "npm|stylelint-lsp",
  sumneko_lua            = "",
  svelte                 = "npm|svelte-language-server",
  svls                   = "cargo|svls",
  terraformls            = "",
  texlab                 = "cargogit|https://github.com/latex-lsp/texlab.git",
  tflint                 = "go|github.com/terraform-linters/tflint",
  tsserver               = "npm|typescript,typescript-language-server",
  vala_ls                = "",
  vimls                  = "npm|vim-language-server",
  vls                    = "",
  vuels                  = "npm|vls",
  yamlls                 = "npm|yaml-language-server",
  zeta_note              = "",
  zls                    = "",
}

-- the table defines the actual commands to be run for
-- each type of install. The keys must correspond to those
-- used in the config table above, and the value represents
-- the command to be run.
--
-- The command MUST embed a %s in it - that will be replaced
-- with the (space separated) list of packages to install.
config.commands = {
  npm      = "npm i --quiet --silent -g %s",
  go       = "cd /tmp && GO111MODULE=on go get %s",
  pip      = "pip3 install --user -U -q %s",
  gem      = "gem install -q --silent --user-install %s",
  nix      = "nix-shell -p %s",
  cabal    = "cabal install %s",
  nim      = "nimble install %s",
  r        = [[R -q --slave -e "install.packages(\"%s\",quiet=T)"]],
  raco     = "raco pkg install %s",
  rust     = "rustup component add %s",
  cargo    = "cargo install %s",
  cargogit = "cargo install --locked --git %s",
}

-- the table holds checks for the various commands,
-- that allow us to determine if the executables are
-- installed or not.
config.checks = {
  go = {"go version", "go(%d+.%d+.%d+) "},
  npm = {"npm -v", "(%d+.%d+.%d+)"},
  r = {"R --version", "R version (%d+.%d+.%d+)"},
  pip = {"pip3 -V", "pip (%d+.%d+.%d+)"},
  gem = {"gem -v", "(%d+.%d+.%d+)"},
}
-- LuaFormatter on

return config
