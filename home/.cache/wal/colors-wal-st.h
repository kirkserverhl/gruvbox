const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#191d24", /* black   */
  [1] = "#5E7CA1", /* red     */
  [2] = "#708797", /* green   */
  [3] = "#7592A5", /* yellow  */
  [4] = "#91999E", /* blue    */
  [5] = "#AFB0AE", /* magenta */
  [6] = "#C3BAB1", /* cyan    */
  [7] = "#c5c6c8", /* white   */

  /* 8 bright colors */
  [8]  = "#616a77",  /* black   */
  [9]  = "#5E7CA1",  /* red     */
  [10] = "#708797", /* green   */
  [11] = "#7592A5", /* yellow  */
  [12] = "#91999E", /* blue    */
  [13] = "#AFB0AE", /* magenta */
  [14] = "#C3BAB1", /* cyan    */
  [15] = "#c5c6c8", /* white   */

  /* special colors */
  [256] = "#191d24", /* background */
  [257] = "#c5c6c8", /* foreground */
  [258] = "#c5c6c8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
