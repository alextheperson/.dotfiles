{ pkgs, ... }: {
  home.packages = with pkgs; [
    lua-language-server

    rust-analyzer

    arduino-language-server

    pylyzer

    nil

    bash-language-server

    svelte-language-server

    typescript-language-server

    vscode-css-languageserver
    css-variables-language-server

    superhtml

    vscode-json-languageserver
  ];
}
