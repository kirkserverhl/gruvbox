const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#151311", /* black   */
  [1] = "#926E5F", /* red     */
  [2] = "#D7724A", /* green   */
  [3] = "#CD6B52", /* yellow  */
  [4] = "#798672", /* blue    */
  [5] = "#999273", /* magenta */
  [6] = "#DAB071", /* cyan    */
  [7] = "#c4c4c3", /* white   */

  /* 8 bright colors */
  [8]  = "#6f645a",  /* black   */
  [9]  = "#926E5F",  /* red     */
  [10] = "#D7724A", /* green   */
  [11] = "#CD6B52", /* yellow  */
  [12] = "#798672", /* blue    */
  [13] = "#999273", /* magenta */
  [14] = "#DAB071", /* cyan    */
  [15] = "#c4c4c3", /* white   */

  /* special colors */
  [256] = "#151311", /* background */
  [257] = "#c4c4c3", /* foreground */
  [258] = "#c4c4c3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
