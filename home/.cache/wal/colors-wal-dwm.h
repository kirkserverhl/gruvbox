static const char norm_fg[] = "#c5c6c8";
static const char norm_bg[] = "#191d24";
static const char norm_border[] = "#616a77";

static const char sel_fg[] = "#c5c6c8";
static const char sel_bg[] = "#708797";
static const char sel_border[] = "#c5c6c8";

static const char urg_fg[] = "#c5c6c8";
static const char urg_bg[] = "#5E7CA1";
static const char urg_border[] = "#5E7CA1";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
