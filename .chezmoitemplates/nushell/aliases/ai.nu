# Init AI models.
export def --env init_ai [] {
  $env.LIBTORCH = $"(brew --cellar pytorch)/(brew info --json pytorch | from json | get 0.installed.0.version)"
  $env.LD_LIBRARY_PATH = $"($env.LIBTORCH)/lib"
}
