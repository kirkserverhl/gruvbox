const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#121414", /* black   */
  [1] = "#DE9D1F", /* red     */
  [2] = "#D89921", /* green   */
  [3] = "#918B54", /* yellow  */
  [4] = "#497E81", /* blue    */
  [5] = "#3A838D", /* magenta */
  [6] = "#458588", /* cyan    */
  [7] = "#c3c4c4", /* white   */

  /* 8 bright colors */
  [8]  = "#5a6f6f",  /* black   */
  [9]  = "#DE9D1F",  /* red     */
  [10] = "#D89921", /* green   */
  [11] = "#918B54", /* yellow  */
  [12] = "#497E81", /* blue    */
  [13] = "#3A838D", /* magenta */
  [14] = "#458588", /* cyan    */
  [15] = "#c3c4c4", /* white   */

  /* special colors */
  [256] = "#121414", /* background */
  [257] = "#c3c4c4", /* foreground */
  [258] = "#c3c4c4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
