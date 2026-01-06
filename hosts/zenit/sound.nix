
{
  services = {
    pipewire = {
      enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = false;
        extraConfig.pipewire.adjust-sample-rate = {
          "context.properties" = {
            #"default.clock.rate" = 192000 ;
            "default.clock.rate" = 48000;
            "default.allowed-rates" = [ 
              #192000 
              96000
              48000 
              44100
            ];
            #"defautlt.allowed-rates" = [ 192000 ];
            #"default.clock.quantum" = 32;
            #"default.clock.min-quantum" = 32;
            #"default.clock.max-quantum" = 32;
          };
        };
        extraConfig.client = { 
          "10-no-resample" = {
            "stream.properties" = {
              "resample.disable" = true;
            };
          };
        };
     };
  };
}


