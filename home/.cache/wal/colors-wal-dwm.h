static const char norm_fg[] = "#c3c3c3";
static const char norm_bg[] = "#101012";
static const char norm_border[] = "#59596d";

static const char sel_fg[] = "#c3c3c3";
static const char sel_bg[] = "#979274";
static const char sel_border[] = "#c3c3c3";

static const char urg_fg[] = "#c3c3c3";
static const char urg_bg[] = "#817D69";
static const char urg_border[] = "#817D69";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
