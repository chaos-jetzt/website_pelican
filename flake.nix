{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    INPUTDIR = "./content";
    OUTPUTDIR = "./tmp";
    CONFFILE = "./pelicanconf.py";
    serve = pkgs.writeScriptBin "serve_page.sh" ''
      #!/usr/bin/env bash 

      if [ -n "$PORT" ]; then
        pelican -l ${INPUTDIR} -o ${OUTPUTDIR} -s ${CONFFILE} -p port
      else
        pelican -l ${INPUTDIR} -o ${OUTPUTDIR} -s ${CONFFILE}
      fi 
    '';
    pkgs = nixpkgs.legacyPackages.x86_64-linux.pkgs;
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      name = "build enviroment";
      buildInputs = [
        serve
        pkgs.python312
        pkgs.python312Packages.pelican
      ];
    };
  };
}
