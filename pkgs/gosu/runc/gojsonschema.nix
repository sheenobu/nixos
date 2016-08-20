{ stdenv, go16Packages }:

let
  gojsonpointer = go16Packages.buildFromGitHub {
    rev = "e0fe6f68307607d540ed8eac07a342c33fa1b54a";
    version = "2015-11-27";
    owner = "xeipuuv";
    repo = "gojsonpointer";
    sha256 = "0yfbisaas3w3ygh0cvb82mj6c1f8adqmnwmyid8l5p12r55531f8";
  };

  gojsonreference = go16Packages.buildFromGitHub {
    rev = "e02fc20de94c78484cd5ffb007f8af96be030a45";
    version = "2015-08-08";
    owner = "xeipuuv";
    repo = "gojsonreference";
    sha256 = "195in5zr3bhb3r1iins2h610kz339naj284b3839xmrhc15wqxzq";
    propagatedBuildInputs = [ gojsonpointer ];
  };
in
  go16Packages.buildFromGitHub {
    rev = "93e72a773fade158921402d6a24c819b48aba29d";
    version = "2016-03-23";
    owner = "xeipuuv";
    repo = "gojsonschema";
    sha256 = "0hqpcy4xgm9xw16dxbs1skrh6ga60bwfjv5dyz5zh86xsxpln3nr";
    propagatedBuildInputs = [ gojsonreference ];
  }
