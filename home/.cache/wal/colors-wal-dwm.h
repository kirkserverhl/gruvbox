static const char norm_fg[] = "#c5c5c5";
static const char norm_bg[] = "#181818";
static const char norm_border[] = "#725d5d";

static const char sel_fg[] = "#c5c5c5";
static const char sel_bg[] = "#D69821";
static const char sel_border[] = "#c5c5c5";

static const char urg_fg[] = "#c5c5c5";
static const char urg_bg[] = "#689D6A";
static const char urg_border[] = "#689D6A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
