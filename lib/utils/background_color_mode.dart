///Enum with available background modes for app
enum BackgroundColorMode { 
  ///show single color background
  singleColor, 
  ///show linear gradient color background
  linearGradient,
  ///show radial gradient color background
  radialGradient }

///Default filters map
  const kFilters = {
  BackgroundColorMode.singleColor: false,
  BackgroundColorMode.linearGradient: false,
  BackgroundColorMode.radialGradient: false,
};
