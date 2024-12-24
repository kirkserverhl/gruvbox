static const char norm_fg[] = "#c4c4c3";
static const char norm_bg[] = "#151311";
static const char norm_border[] = "#6f645a";

static const char sel_fg[] = "#c4c4c3";
static const char sel_bg[] = "#D7724A";
static const char sel_border[] = "#c4c4c3";

static const char urg_fg[] = "#c4c4c3";
static const char urg_bg[] = "#926E5F";
static const char urg_border[] = "#926E5F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
