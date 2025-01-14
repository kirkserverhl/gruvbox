const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#10141b", /* black   */
  [1] = "#80807F", /* red     */
  [2] = "#797C83", /* green   */
  [3] = "#7E8187", /* yellow  */
  [4] = "#8B8E92", /* blue    */
  [5] = "#A5A8AE", /* magenta */
  [6] = "#BABEC5", /* cyan    */
  [7] = "#c3c4c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5c6570",  /* black   */
  [9]  = "#80807F",  /* red     */
  [10] = "#797C83", /* green   */
  [11] = "#7E8187", /* yellow  */
  [12] = "#8B8E92", /* blue    */
  [13] = "#A5A8AE", /* magenta */
  [14] = "#BABEC5", /* cyan    */
  [15] = "#c3c4c6", /* white   */

  /* special colors */
  [256] = "#10141b", /* background */
  [257] = "#c3c4c6", /* foreground */
  [258] = "#c3c4c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
