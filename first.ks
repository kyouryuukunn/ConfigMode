@call storage=config_init.ks

*title|title

[link storage=first.ks target=*config]config[endlink]
@s

*config
@call storage=config.ks target=*initialize
