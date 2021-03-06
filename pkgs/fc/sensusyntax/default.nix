{ stdenv, lib, rustPlatform, docutils }:

rustPlatform.buildRustPackage rec {
  name = "sensu-syntax-${version}";
  version = "0.1.0";

  src = lib.cleanSource ./.;
  cargoSha256 = "068v020zia1cnzmjgb36v39ldh90pv30wvh3s84qmf1nqdvv9laf";
  doCheck = true;

  meta = with stdenv.lib; {
    description = "Sensu client config self-check";
    license = with licenses; [ bsd3 ];
    platforms = platforms.all;
  };
}
