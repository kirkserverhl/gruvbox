static const char norm_fg[] = "#c2c4c5";
static const char norm_bg[] = "#0E1318";
static const char norm_border[] = "#5a646f";

static const char sel_fg[] = "#c2c4c5";
static const char sel_bg[] = "#7C8375";
static const char sel_border[] = "#c2c4c5";

static const char urg_fg[] = "#c2c4c5";
static const char urg_bg[] = "#6C7269";
static const char urg_border[] = "#6C7269";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
