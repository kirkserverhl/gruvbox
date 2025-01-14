static const char norm_fg[] = "#c3c3c3";
static const char norm_bg[] = "#0f0f0f";
static const char norm_border[] = "#6c5959";

static const char sel_fg[] = "#c3c3c3";
static const char sel_bg[] = "#A23D3D";
static const char sel_border[] = "#c3c3c3";

static const char urg_fg[] = "#c3c3c3";
static const char urg_bg[] = "#933737";
static const char urg_border[] = "#933737";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
