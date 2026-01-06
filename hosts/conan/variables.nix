{ config, lib, pkgs, ... }: 

{
  _module.args = {
    Machine = {
      hostname = "conan";
      username = "nico";
      userDescription = "Nico Nicklis";
    };
  };
}
